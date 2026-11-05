# Full artifact (~40-60 min: the 1e7-element timing cells and the 512-bit mpfr
# reference dominate). Renders to qnorm-jax-comparison.html.
QNORM_PY="$(cd ../../../py-benchmarks/.venv/bin && pwd)/python" quarto render qnorm-jax-comparison.qmd

# Quick preview -- thinned grids, sizes up to 1e4, 60 random targets. Exercises
# every code path in ~90s. The numbers are NOT reportable.
QNORM_FULL=0 QNORM_PY="$(cd ../../../py-benchmarks/.venv/bin && pwd)/python" quarto render qnorm-jax-comparison.qmd

# Accuracy only (no timings), or anvl + R only (no Python needed at all).
QNORM_PERF=0 quarto render qnorm-jax-comparison.qmd
QNORM_JAX=0 quarto render qnorm-jax-comparison.qmd

# On a GPU box: needs the matching PJRT plugin (anvl) and a CUDA jaxlib (JAX).
DEVICE=cuda quarto render qnorm-jax-comparison.qmd
