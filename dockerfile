# Utiliser l'image officielle de Rust en tant qu'image de base
FROM rust:latest

# Créer un répertoire de travail pour l'application
WORKDIR /app


# Cloner le projet depuis GitHub, il faut modifier l'url pour correspondre au bon repo
RUN git clone https://github.com/cortowc/moseiik.git .

# on build l'apps qu'une seul fois
RUN cargo build --release

# Définir la commande par défaut pour exécuter l'application lorsque le conteneur démarre
# run les test 
ENTRYPOINT ["cargo", "test", "--release", "--"]

# run le projet
#ENTRYPOINT ["cargo", "run", "--release", "--"]



#docker build -t img_one_arm --platform linux/arm64
#docker build -t img_one --platform linux/amd64

#docker run  --rm --platform linux/amd64 img_one --image "assets/target-small.png" --tiles "assets/tiles-small" 
#docker run  --rm --platform linux/arm64 img_one --image "assets/target-small.png" --tiles "assets/tiles-small" 