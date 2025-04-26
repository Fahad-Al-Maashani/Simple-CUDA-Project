# Simple-CUDA-Project.
# Simple CUDA Array Addition

A minimal example showing how to use NVIDIA CUDA to add two integer arrays in parallel on the GPU.


## Description

This project demonstrates:

- Allocating memory on both host (CPU) and device (GPU)  
- Copying data between CPU and GPU  
- Launching a simple CUDA kernel to perform element-wise array addition  
- Retrieving and printing results on the host  

It’s the perfect “hello world” for learning basic CUDA programming.



## Prerequisites

- NVIDIA GPU with CUDA support  
- CUDA Toolkit (tested with CUDA 11.x and newer)  
- `nvcc` compiler in your `PATH`  
- A Unix-style shell (Linux/macOS) or Windows with [WSL2](https://docs.microsoft.com/windows/wsl/)  



## Building

1. Open a terminal in the project directory.  
2. Run the NVIDIA CUDA compiler:

   ```bash
   nvcc array_add.cu -o array_add
   ```bash
   execute
   ```bash
   ./array_add
  ```bash
Expected output:
Result:
0 + 0 = 0
1 + 1 = 2
2 + 4 = 6
3 + 9 = 12
4 + 16 = 20
5 + 25 = 30
6 + 36 = 42
7 + 49 = 56
8 + 64 = 72
9 + 81 = 90

This project is released under the MIT License. Feel free to copy, modify, and share!


