conda create -n mamba python=3.11 -y
conda activate mamba

pip install torch==2.6.0 torchvision==0.21.0 torchaudio==2.6.0 --index-url https://download.pytorch.org/whl/cu124


pip install https://github.com/state-spaces/mamba/releases/download/v2.2.4/mamba_ssm-2.2.4+cu12torch2.6xx11abiFALSE-cp311-cp311-linux_x86_64.whl
pip install https://github.com/Dao-AILab/causal-conv1d/releases/download/v1.5.0.post8/causal_conv1d-1.5.0.post8+cu12torch2.6cxx11abiFALSE-cp311-cp311-linux_x86_64.whl

pip install mambavision pycocotools scikit-learn datasets

pip install \
  mmengine==0.10.1 \
  mmcv==2.1.0 \
  opencv-python-headless \
  mmdet==3.3.0 \
  mmsegmentation==1.2.2 \
  mmpretrain==1.2.0 \
  ftfy
