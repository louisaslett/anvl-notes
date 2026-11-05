
quarto render threshold-lower.qmd

quarto render threshold-upper.qmd

quarto render pnorm-jax-comparison.qmd
# OR with flags
PNORM_FULL=0 PNORM_PY="$(cd ../../../py-benchmarks/.venv/bin && pwd)/python" quarto render pnorm-jax-comparison.qmd
