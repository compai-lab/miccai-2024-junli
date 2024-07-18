# 使用一个基础的Docker镜像，可以根据你的需求选择合适的镜像
FROM continuumio/miniconda3

# 设置工作目录
WORKDIR /app

# 复制Conda环境的配置文件（environment.yml）到容器中
COPY environment.yml .

# 使用Conda创建环境
RUN conda env create -f environment.yml

# 激活Conda环境
RUN echo "source activate vqa" > ~/.bashrc
ENV PATH /opt/conda/envs/vqa/bin:$PATH

# 添加你的应用程序代码和文件到容器中
COPY . .

# 定义容器启动时运行的命令
CMD ["python", "run.py"]
