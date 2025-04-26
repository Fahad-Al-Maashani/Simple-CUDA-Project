#include <stdio.h>
#include <cuda_runtime.h>

// Kernel function to add two arrays
__global__ void arrayAdd(int *a, int *b, int *c, int N){
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    if(idx < N)
        c[idx] = a[idx] + b[idx];
}

int main(){
    const int N = 10;
    int size = N * sizeof(int);

    // Allocate host arrays
    int h_a[N], h_b[N], h_c[N];

    // Initialize host arrays
    for(int i = 0; i < N; i++){
        h_a[i] = i;
        h_b[i] = i * i;
    }

    // Allocate device arrays
    int *d_a, *d_b, *d_c;
    cudaMalloc((void**)&d_a, size);
    cudaMalloc((void**)&d_b, size);
    cudaMalloc((void**)&d_c, size);

    // Copy data to GPU
    cudaMemcpy(d_a, h_a, size, cudaMemcpyHostToDevice);
    cudaMemcpy(d_b, h_b, size, cudaMemcpyHostToDevice);

    // Launch kernel (1 block, N threads)
    arrayAdd<<<1, N>>>(d_a, d_b, d_c, N);

    // Copy result back to host
    cudaMemcpy(h_c, d_c, size, cudaMemcpyDeviceToHost);

    // Print result
    printf("Result:\n");
    for(int i = 0; i < N; i++){
        printf("%d + %d = %d\n", h_a[i], h_b[i], h_c[i]);
    }

    // Free device memory
    cudaFree(d_a);
    cudaFree(d_b);
    cudaFree(d_c);

    return 0;
}
