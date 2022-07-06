#include <stdio.h>
#include <math.h>
#include <string.h>
#include <stdlib.h>
#include <string.h>
#include "cephes.h"

#define MAX(x,y)             ((x) <  (y)  ? (y)  : (x))

#define TRNG  "0000111100101010101011010100010001101010110001101100010111110111101001010001110101101110111100011100"
#define LCG   "0010010000011101111110101001110100100100000111011111101010011101001001000001110111111010100111010010"
#define BBC   "1100100010101010011100100010101010011100100010101010011100100010101010011100100010101010011100100010"

#define ALPHA							0.01	/* SIGNIFICANCE LEVEL */
typedef unsigned char BitSequence;

BitSequence	*epsilon;				// BIT STREAM
//char *B = "00001";
char *B = "101";

#define BITLENGTH 100
#define TEMPLATELENGTH 3
#define BITLENGTHTEST 16
#define MAXNUMOFTEMPLATES				148		/* APERIODIC TEMPLATES: 148=>temp_length=9 */
// might make this return a p_value

void frequency(int n)
{
    int i;
    double f, s_obs, sum, p_value;
	//double sqrt2 = 1.41421356237309504880;;
    sum = 0.0;
    for( i = 0; i < n; i++)
	{
        if (epsilon[i] == '1')
			sum += 1;
		else
			sum -= 1;
	}

	s_obs = fabs(sum)/sqrt(n);
    f = s_obs/(sqrt(2));
    p_value = erfc(f);

    // deal with how output values later 
    //check if p value is random
	printf("Frequency %s\t\tp_value = %f\n\n", p_value < ALPHA ? "FAILURE" : "SUCCESS", p_value); 

}

void runs(int n)
{
    int S, i;
    double pi, V, erfc_arg, p_value;

    S = 0;
    for (i =0; i < n; i++)
        if(epsilon[i] == '1')
            S++;
    pi = (double)S / (double)n;

	// Dont runs test if failed frequency test
    if(fabs(pi -0.5) > (2.0 / sqrt(n)))
        p_value = 0.0;
    else
    {
        V = 1;
        for(i = 1; i < n; i++)
            if(epsilon[i] == '1')
                V++;
            
        erfc_arg = fabs(V - 2.0 * n * pi * (1-pi)) / (2.0 * pi * (1-pi) * sqrt(2*n));
        p_value = erfc(erfc_arg);
    
    }

	printf("Runs %s\t\tp_value = %f\n\n", p_value < ALPHA ? "FAILURE" : "SUCCESS", p_value); 
}

void nonOverlappingTemplateMatchings(int m, int n)
{
	int i, hits;
	
	double u, M, var, arg, X_obs, p_value;
	M = BITLENGTH;
	hits = 0;
	u = (M - m + 1)/ (pow(2, m));

	arg = (1/pow(2, m)) - ((2*m -1)/ pow(2, 2 *m));
	var = M * (arg);
	for(i = 0; i < n; i++ )
	{
		// check to see if substring matches template
		char *start = &epsilon[i];
		char *end = &epsilon[i + (m - 1)];
		char *substr = (char *)calloc(1, end - start + 1);
		memcpy(substr, start, end - start);
		// if there is a hit increment X
		if(strcmp(substr, B) == 0)
		{
			hits++;
			i+= (m -1 ); // could be just m 
		}
	}

	X_obs = pow((1 - u), 2) / var;
	p_value = cephes_igamc(0.5, X_obs/2.0);
	printf("Non Overlapping Template Test %s\t\tp_value = %f\n\n", p_value < ALPHA ? "FAILURE" : "SUCCESS", p_value);

}


void overlappingTemplateMatchings(int m, int n)
{
	int i, k,  hits;
	int v[6]; // can this be mutable ?
	double	pi[6] = { 0.364091, 0.185659, 0.139381, 0.100571, 0.0704323, 0.139865 };
	double u, M, var, arg, X_obs, p_value;
	M = BITLENGTH;
	hits = 0;
	u = (M - m + 1)/ (pow(2, m));
	arg = (1/pow(2, m)) - ((2*m -1)/ pow(2, 2 *m));
	var = M * (arg);
	for(i = 0; i < n; i++ )
	{
		// check to see if substring matches template
		char *start = &epsilon[i];
		char *end = &epsilon[i + (m - 1)];
		char *substr = (char *)calloc(1, end - start + 1);
		memcpy(substr, start, end - start);
		// if there is a hit increment X
		if(strcmp(substr, B) == 0)
			hits++; 
	}
	if(hits == 0)
		v[0] = 1;
	else if(hits == 1)
		v[1] = 1;
	else if(hits == 2)
		v[2] = 1;
	else if(hits == 3)
		v[3] = 1;
	else if(hits == 4)
		v[4] = 1;
	else
		v[5] = 1;

	for(k = 0; k < 5; k++)
		X_obs += pow(v[k] - pi[k], 2)/ (pi[k]);
	
	p_value = cephes_igamc(5/2, X_obs/2.0);
	printf(" Overlapping Matching Test: %s\t\tp_value = %f\n\n", p_value < ALPHA ? "FAILURE" : "SUCCESS", p_value);	

} 

void linearComplexity(int M, int n)
{
	int       i, ii, j, d, N, L, m, N_, parity, sign, K = 6;
	double    p_value, T_, mean, nu[7], chi2;
	double    pi[7] = { 0.01047, 0.03125, 0.12500, 0.50000, 0.25000, 0.06250, 0.020833 };
	BitSequence  *T = NULL, *P = NULL, *B_ = NULL, *C = NULL;
	
	N = (int)floor(n/M);
	if ( ((B_ = (BitSequence *) calloc(M, sizeof(BitSequence))) == NULL) ||
		 ((C  = (BitSequence *) calloc(M, sizeof(BitSequence))) == NULL) ||
		 ((P  = (BitSequence *) calloc(M, sizeof(BitSequence))) == NULL) ||
		 ((T  = (BitSequence *) calloc(M, sizeof(BitSequence))) == NULL) ) {
		printf("Insufficient Memory for Work Space:: Linear Complexity Test\n");
		if ( B_ != NULL )
			free(B_);
		if ( C != NULL )
			free(C);
		if ( P != NULL )
			free(P);
		if ( T != NULL )
			free(T);
		return;
	}

	for ( i=0; i<K+1; i++ )
		nu[i] = 0.00;
	for ( ii=0; ii<N; ii++ ) {
		for ( i=0; i<M; i++ ) {
			B_[i] = 0;
			C[i] = 0;
			T[i] = 0;
			P[i] = 0;
		}
		L = 0;
		m = -1;
		d = 0;
		C[0] = 1;
		B_[0] = 1;
		
		/* DETERMINE LINEAR COMPLEXITY */
		N_ = 0;
		while ( N_ < M ) {
			d = (int)epsilon[ii*M+N_];
			for ( i=1; i<=L; i++ )
				d += C[i] * epsilon[ii*M+N_-i];
			d = d%2;
			if ( d == 1 ) {
				for ( i=0; i<M; i++ ) {
					T[i] = C[i];
					P[i] = 0;
				}
				for ( j=0; j<M; j++ )
					if ( B_[j] == 1 )
						P[j+N_-m] = 1;
				for ( i=0; i<M; i++ )
					C[i] = (C[i] + P[i])%2;
				if ( L <= N_/2 ) {
					L = N_ + 1 - L;
					m = N_;
					for ( i=0; i<M; i++ )
						B_[i] = T[i];
				}
			}
			N_++;
		}
		if ( (parity = (M+1)%2) == 0 ) 
			sign = -1;
		else 
			sign = 1;
		mean = M/2.0 + (9.0+sign)/36.0 - 1.0/pow(2, M) * (M/3.0 + 2.0/9.0);
		if ( (parity = M%2) == 0 )
			sign = 1;
		else 
			sign = -1;
		T_ = sign * (L - mean) + 2.0/9.0;
		
		if ( T_ <= -2.5 )
			nu[0]++;
		else if ( T_ > -2.5 && T_ <= -1.5 )
			nu[1]++;
		else if ( T_ > -1.5 && T_ <= -0.5 )
			nu[2]++;
		else if ( T_ > -0.5 && T_ <= 0.5 )
			nu[3]++;
		else if ( T_ > 0.5 && T_ <= 1.5 )
			nu[4]++;
		else if ( T_ > 1.5 && T_ <= 2.5 )
			nu[5]++;
		else
			nu[6]++;
	}
	chi2 = 0.00;

	for ( i=0; i<K+1; i++ )
		chi2 += pow(nu[i]-N*pi[i], 2) / (N*pi[i]);
	p_value = cephes_igamc(K/2.0, chi2/2.0);

	printf("Linear Complexity test: %s\t\tp_value = %f\n\n", p_value < ALPHA ? "FAILURE" : "SUCCESS", p_value); 

	free(B_);
	free(P);
	free(C);
	free(T);
}

void approximateEntropy(int m, int n)
{
	int				i, j, k, r, blockSize, seqLength, powLen, index;
	double			sum, numOfBlocks, ApEn[2], apen, chi_squared, p_value;
	unsigned int	*P;
	
	seqLength = n;
	r = 0;
	
	for ( blockSize=m; blockSize<=m+1; blockSize++ ) {
		if ( blockSize == 0 ) {
			ApEn[0] = 0.00;
			r++;
		}
		else {
			numOfBlocks = (double)seqLength;
			powLen = (int)pow(2, blockSize+1)-1;
			if ( (P = (unsigned int*)calloc(powLen,sizeof(unsigned int)))== NULL ) {
				fprintf(stderr, "ApEn:  Insufficient memory available.\n");
				return;
			}
			for ( i=1; i<powLen-1; i++ )
				P[i] = 0;
			for ( i=0; i<numOfBlocks; i++ ) { /* COMPUTE FREQUENCY */
				k = 1;
				for ( j=0; j<blockSize; j++ ) {
					k <<= 1;
					if ( (int)epsilon[(i+j) % seqLength] == 1 )
						k++;
				}
				P[k-1]++;
			}
			/* DISPLAY FREQUENCY */
			sum = 0.0;
			index = (int)pow(2, blockSize)-1;
			for ( i=0; i<(int)pow(2, blockSize); i++ ) {
				if ( P[index] > 0 )
					sum += P[index]*log(P[index]/numOfBlocks);
				index++;
			}
			sum /= numOfBlocks;
			ApEn[r] = sum;
			r++;
			free(P);
		}
	}
	apen = ApEn[0] - ApEn[1];
	
	chi_squared = 2.0*seqLength*(log(2) - apen);
	p_value = cephes_igamc(pow(2, m-1), chi_squared/2.0);
	
	printf("Approximate Entropy Test %s\t\tp_value = %f\n\n", p_value < ALPHA ? "FAILURE" : "SUCCESS", p_value); 
}

void randomExcursionsVariant(int n)
{
	int		i, p, J, x, constraint, count, *S_k;
	int		stateX[18] = { -9, -8, -7, -6, -5, -4, -3, -2, -1, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
	double	p_value;
	
	if ( (S_k = (int *)calloc(n, sizeof(int))) == NULL ) {
		fprintf(stderr, "\t\tRANDOM EXCURSIONS VARIANT: Insufficent memory allocated.\n");
		return;
	}
	J = 0;
	S_k[0] = 2*(int)epsilon[0] - 1;
	for ( i=1; i<n; i++ ) {
		S_k[i] = S_k[i-1] + 2*epsilon[i] - 1;
		if ( S_k[i] == 0 )
			J++;
	}
	if ( S_k[n-1] != 0 )
		J++;

	for ( p=0; p<=17; p++ ) 
	{
		x = stateX[p];
		count = 0;
		for ( i=0; i<n; i++ )
			if ( S_k[i] == x )
				count++;
		p_value = erfc(fabs(count-J)/(sqrt(2.0*J*(4.0*fabs(x)-2))));

		printf("Random Excursion Test: %s\t\tp_value = %f\n\n", p_value < ALPHA ? "FAILURE" : "SUCCESS", p_value); 
			
	}
	
	
	free(S_k);
}

double	Pr(int u, double eta);

void
OverlappingTemplateMatchings(int m, int n)
{
	int				i, k, match;
	double			W_obs, eta, sum, chi2, p_value, lambda;
	int				M, N, j, K = 5;
	unsigned int	nu[6] = { 0, 0, 0, 0, 0, 0 };
	//double			pi[6] = { 0.143783, 0.139430, 0.137319, 0.124314, 0.106209, 0.348945 };
	double			pi[6] = { 0.364091, 0.185659, 0.139381, 0.100571, 0.0704323, 0.139865 };
	BitSequence		*sequence;

	M = 1032;
	N = n/M;
	
	if ( (sequence = (BitSequence *) calloc(m, sizeof(BitSequence))) == NULL ) 
		fprintf(stderr, "\t\tTEMPLATE DEFINITION:  Insufficient memory, Overlapping Template Matchings test aborted!\n");
	
	else
		for ( i=0; i<m; i++ )
			sequence[i] = 1;
	
	lambda = (double)(M-m+1)/pow(2,m);
	eta = lambda/2.0;
	sum = 0.0;
	for ( i=0; i<K; i++ ) {			/* Compute Probabilities */
		pi[i] = Pr(i, eta);
		sum += pi[i];
	}
	pi[K] = 1 - sum;

	for ( i=0; i<N; i++ ) {
		W_obs = 0;
		for ( j=0; j<M-m+1; j++ ) {
			match = 1;
			for ( k=0; k<m; k++ ) {
				if ( sequence[k] != epsilon[i*M+j+k] )
					match = 0;
			}
			if ( match == 1 )
				W_obs++;
		}
		if ( W_obs <= 4 )
			nu[(int)W_obs]++;
		else
			nu[K]++;
	}
	sum = 0;
	chi2 = 0.0;                                   /* Compute Chi Square */
	for ( i=0; i<K+1; i++ ) {
		chi2 += pow((double)nu[i] - (double)N*pi[i], 2)/((double)N*pi[i]);
		sum += nu[i];
	}
	p_value = cephes_igamc(K/2.0, chi2/2.0);



	free(sequence);
	printf("%s\t\tp_value = %f\n\n", p_value < ALPHA ? "FAILURE" : "SUCCESS", p_value); 
	
}

double
Pr(int u, double eta)
{
	int		l;
	double	sum, p;
	
	if ( u == 0 )
		p = exp(-eta);
	else {
		sum = 0.0;
		for ( l=1; l<=u; l++ )
			sum += exp(-eta-u*log(2)+l*log(eta)-cephes_lgam(l+1)+cephes_lgam(u)-cephes_lgam(l)-cephes_lgam(u-l+1));
		p = sum;
	}
	return p;
}


int main()
{
    int n = BITLENGTH;
    int m = strlen(B);
    int M1 = BITLENGTHTEST;
    // change set episol to LCG or BBC to see if they pass the random tests
	
    epsilon = TRNG;

    frequency(n);
    runs(n);
    nonOverlappingTemplateMatchings(m, n);
    overlappingTemplateMatchings(m, n);
    linearComplexity(M1, n);
    approximateEntropy(m, n);
    randomExcursionsVariant(n);
	
    return 0;

}