# 🚀 crDroid 13 - Raphael Edition (by Jairo Rossi)
> Versão customizada e otimizada do crDroid 9 (Android 13) para Xiaomi Mi 9T Pro / Redmi K20 Pro (`raphael`).

---

## ✨ Recursos e Melhorias Exclusivas desta Edição

1. **KernelSU Integrado Nativo:**
   - Aplicativo de gerenciamento KernelSU pré-instalado como aplicativo de sistema em `/system/app/KernelSU/`.
2. **Correção do Leitor de Digitais (FOD Goodix):**
   - Cor de iluminação configurada para **Verde Sólido (`#ff00ff00`)** para máxima precisão do sensor óptico.
   - Brilho da tela sobe automaticamente para **60%** sempre que o leitor biométrico for acionado.
3. **Fix de Cores no Google Fotos (HDR/WCG):**
   - SurfaceFlinger configurado para desativar wide color gamut forçado, evitando cores lavadas nas fotos.
4. **Play Integrity Spoofing Desativado por Padrão:**
   - Evita conflitos com módulos Magisk / KernelSU.
5. **Identidade Visual Personalizada:**
   - Logo customizado em *Configurações > Sobre o Dispositivo*.
   - Nome oficial da build: `crDroid Raphael Edition - by Jairo`.
   - Bootanimation personalizada (`Cutsbootanimation`).

---

## 🛠️ Como Compilar em Qualquer Servidor Novo (Passo a Passo)

### 1. Instalar as dependências no Ubuntu/Debian:
```bash
sudo apt update && sudo apt install -y bc bison build-essential ccache curl flex g++-multilib gcc-multilib git git-lfs gnupg gperf imagemagick lib32readline-dev lib32z1-dev libelf-dev liblz4-tool libncurses5 libncurses5-dev libsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev python3 openjdk-11-jdk
```

### 2. Instalar o utilitário `repo`:
```bash
mkdir -p ~/.bin
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/.bin/repo
chmod a+x ~/.bin/repo
export PATH=~/.bin:$PATH
```

### 3. Inicializar a árvore do crDroid 13:
```bash
mkdir -p /mnt/android && cd /mnt/android
repo init -u https://github.com/crdroidandroid/android.git -b 13.0 --git-lfs
```

### 4. Baixar os Manifestos Customizados desta Edição:
```bash
git clone https://github.com/jairorossi/crDroid-Raphael-Edition.git .repo/local_manifests
```

### 5. Sincronizar os Repositórios:
```bash
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
```

### 6. Aplicar o patch do Frameworks/Base (Brilho FOD & Play Integrity):
```bash
cd /mnt/android/frameworks/base
git am /mnt/android/.repo/local_manifests/patches/*.patch || true
cd /mnt/android
```

### 7. Compilar a ROM:
```bash
source build/envsetup.sh
brunch raphael
```

Ao finalizar, o arquivo `.zip` flashável estará pronto em:
`/mnt/android/out/target/product/raphael/crDroidAndroid-13.0-*-raphael-v9.20.zip`

---

## 📂 Repositórios Customizados no GitHub
- [Device Tree (device/xiaomi/raphael)](https://github.com/jairorossi/android_device_xiaomi_raphael)
- [Hardware Xiaomi (hardware/xiaomi)](https://github.com/jairorossi/android_hardware_xiaomi)
- [Vendor Addons & Bootanimation (vendor/addons)](https://github.com/jairorossi/android_vendor_addons)
- [Settings (packages/apps/Settings)](https://github.com/jairorossi/android_packages_apps_Settings)
- [crDroid Settings (packages/apps/crDroidSettings)](https://github.com/jairorossi/android_packages_apps_crDroidSettings)
- [KernelSU Prebuilt (packages/apps/KernelSU)](https://github.com/jairorossi/android_packages_apps_KernelSU)
- [Telephony (packages/services/Telephony)](https://github.com/jairorossi/android_packages_services_Telephony)
- [Mms (packages/services/Mms)](https://github.com/jairorossi/android_packages_services_Mms)
- [Build Core (build/make)](https://github.com/jairorossi/android_build)
