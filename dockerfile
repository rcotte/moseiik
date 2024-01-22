# Utiliser l'image officielle de Rust en tant qu'image de base
FROM rust:latest

# Créer un répertoire de travail pour l'application
WORKDIR /app


# Cloner le projet depuis GitHub, il faut modifier l'url pour correspondre au bon repo
RUN git clone https://github.com/rcotte/moseiik.git .
RUN cd assets
RUN wget -q "https://filesender.renater.fr/download.php?token=178558c6-7155-4dca-9ecf-76cbebeb422e&files_ids=33679270" -O images.zip
RUN unzip -q images.zip
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
