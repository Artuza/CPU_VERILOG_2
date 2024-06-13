def fibonacci(n):
    if n <= 0:
        return []
    elif n == 1:
        return [0]
    elif n == 2:
        return [0, 1]
    else:
        fib_sequence = [0, 1]
        for i in range(2, n):
            fib_sequence.append(fib_sequence[-1] + fib_sequence[-2])
        return fib_sequence

# Ejemplo de uso
n = 10  # Número de términos de Fibonacci a calcular
fib_sequence = fibonacci(n)
print(f"Secuencia de Fibonacci para los primeros {n} términos: {fib_sequence}")
