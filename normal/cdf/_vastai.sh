# Additional steps after launching from
# louisaslett/vastai-r image

# Activate uv + install JAX
source .venv/bin/activate
uv pip install "jax[cuda13]"
python -c "import jax; print(jax.devices())"
uv pip install google-benchmark

# Install Quarto
wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.9.38/quarto-1.9.38-linux-amd64.tar.gz
mkdir ~/opt
tar -C ~/opt -xvzf quarto-1.9.38-linux-amd64.tar.gz
ln -s ~/opt/quarto-1.9.38/bin/quarto /usr/bin/quarto
quarto check

# Install R deps
install.packages(c("reticulate","Rmpfr", "jsonlite", "bench", "ggplot2", "plotly", "dplyr", "tidyr", "DT", "htmltools"))
install.packages(c("checkmate", "pak"))
pak::pak(c("r-xla/stablehlo","r-xla/pjrt","r-xla/tengen","r-xla/xlamisc"))
install.packages("cuda12.8", repos = "https://mlverse.r-universe.dev")

# Install anvl (after copy up)
devtools::load_all()
