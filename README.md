# 🚀 crDroid 13 - Raphael Edition (by Jairo Rossi)
> Versão customizada e otimizada do **crDroid 9.20 (Android 13)** para **Xiaomi Mi 9T Pro / Redmi K20 Pro (`raphael`)**.

---

## ✨ Recursos e Melhorias Exclusivas desta Edição

1. 🛡️ **KernelSU Integrado Nativo:**
   - Aplicativo KernelSU embutido diretamente como app de sistema em `/system/app/KernelSU/`.
2. 🟢 **Correção Definitiva do Leitor de Digitais (FOD Goodix):**
   - Luz do sensor óptico configurada para **Verde Sólido (`#ff00ff00`)** (a mesma correção oficial do Android 14 que elimina falhas de leitura e cadastro).
   - **Brilho Dinâmico:** A tela sobe automaticamente para **60% de brilho** sempre que a digital for solicitada para garantir 100% de precisão.
3. 📸 **Fix de Cores no Google Fotos (HDR/WCG):**
   - SurfaceFlinger configurado para desativar wide color gamut forçado, eliminando cores lavadas ao visualizar fotos.
4. 🔒 **Play Integrity Spoofing Desativado por Padrão:**
   - Evita conflitos com módulos Magisk / KernelSU de integridade.
5. 🎨 **Identidade Visual Personalizada:**
   - Logo customizado em *Configurações > Sobre o Dispositivo*.
   - Nome oficial da build: `crDroid Raphael Edition - by Jairo`.
   - Nova Bootanimation (`Cutsbootanimation`).

---

## 📥 Guia de Instalação e Downloads

### 📦 Links Diretos dos Arquivos Necessários:

| Arquivo | Descrição | Link para Download |
| :--- | :--- | :--- |
| 🦊 **OrangeFox Recovery** | Recovery R11.3 Unified Unofficial com suporte a Retrofit Dynamic Partitions | [Baixar no Gofile](https://gofile.io/d/ViAUVw29) |
| 🔄 **Script Retrofit Dynamic** | Conversor de partições Legacy para Dynamic Partitions | [Baixar no Gofile](https://gofile.io/d/xHIgmhrp) |
| 📶 **Firmware MIUI 12.5.2** | Firmware Oficial MIUI Global Android 11 para Raphael | [Baixar no Gofile](https://gofile.io/d/iMakeCes) |
| 📱 **ROM crDroid Raphael Edition** | ROM completa Android 13 com todas as melhorias e KernelSU | [Baixar no Gofile](https://gofile.io/d/p5suslGb) |
| 🛡️ **KernelSU APK (v0.9.5)** | Gerenciador do KernelSU standalone (já vem na ROM) | [Baixar no Gofile](https://gofile.io/d/vUpOHP4z) |
| 🔓 **DFE (Disable Dm-Verity)** | Script de desencriptação opcional | [Baixar no Gofile](https://gofile.io/d/0aJpF663) |
| 🌐 **NikGapps (Opcional)** | Pacote de Google Apps e Play Store (Basic/Core para A13) | [Site Oficial NikGapps](https://nikgapps.com/) |

---

### 📲 Passo a Passo de Instalação (OrangeFox / TWRP):

#### Passo 1: Converter para Partições Dinâmicas (Retrofit)
1. Reinicie no **OrangeFox Recovery**.
2. Vá em **Install** e instale o [Script Retrofit Dynamic](https://gofile.io/d/xHIgmhrp).
3. Vá em **Wipe > Advanced Wipe** e marque:
   - [X] Dalvik / ART Cache
   - [X] Cache
   - [X] Data
   - [X] Metadata
4. Arraste para confirmar o Wipe.
5. Vá no menu principal > **Reboot > Recovery** (⚠️ **Obrigatório reiniciar o Recovery antes de continuar!**).

#### Passo 2: Instalar Firmware e ROM
1. Quando o Recovery reiniciar, vá em **Install**.
2. Instale o [Firmware MIUI 12.5.2 Global](https://gofile.io/d/iMakeCes).
3. Em seguida, instale o arquivo da [ROM crDroid Raphael Edition](https://gofile.io/d/p5suslGb).

#### Passo 3: GApps e DFE (Opcionais)
1. *(Opcional)* Se desejar os serviços do Google e Play Store, instale o **NikGapps**.
2. *(Opcional)* Se não quiser encriptação forçada, instale o [Disable_Dm-Verity_ForceEncrypt](https://gofile.io/d/0aJpF663).

#### Passo 4: Format Data e Inicialização
1. Vá em **Wipe > Format Data**.
2. Digite `yes` e confirme no botão verde.
3. Toque em **Reboot System** e aproveite sua **crDroid Raphael Edition**!

> 💡 **Automação via PC:** Na pasta [`tools/`](./tools) você encontra o script `flash_raphael.bat` que automatiza esses envios via ADB Sideload com 1 clique pelo Windows!

---

## 🛠️ Como Compilar a ROM em Qualquer Servidor (Build Guide)

```bash
# 1. Instalar dependências
sudo apt update && sudo apt install -y bc bison build-essential ccache curl flex g++-multilib gcc-multilib git git-lfs gnupg gperf imagemagick lib32readline-dev lib32z1-dev libelf-dev liblz4-tool libncurses5 libncurses5-dev libsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev python3 openjdk-11-jdk

# 2. Instalar repo
mkdir -p ~/.bin && curl https://storage.googleapis.com/git-repo-downloads/repo > ~/.bin/repo && chmod a+x ~/.bin/repo && export PATH=~/.bin:$PATH

# 3. Inicializar árvore crDroid 13
mkdir -p /mnt/android && cd /mnt/android
repo init -u https://github.com/crdroidandroid/android.git -b 13.0 --git-lfs

# 4. Baixar Manifestos Customizados desta Edição
git clone https://github.com/jairorossi/crDroid-Raphael-Edition.git .repo/local_manifests

# 5. Sincronizar Repositórios
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

# 6. Aplicar Patches no Framework
cd /mnt/android/frameworks/base
git am /mnt/android/.repo/local_manifests/patches/*.patch || true
cd /mnt/android

# 7. Compilar
source build/envsetup.sh
brunch raphael
```

---

## 📂 Repositórios Customizados no GitHub
- [📱 Device Tree (device/xiaomi/raphael)](https://github.com/jairorossi/android_device_xiaomi_raphael)
- [📷 Hardware Xiaomi (hardware/xiaomi)](https://github.com/jairorossi/android_hardware_xiaomi)
- [🎬 Vendor Addons & Bootanimation (vendor/addons)](https://github.com/jairorossi/android_vendor_addons)
- [⚙️ Settings (packages/apps/Settings)](https://github.com/jairorossi/android_packages_apps_Settings)
- [🎛️ crDroid Settings (packages/apps/crDroidSettings)](https://github.com/jairorossi/android_packages_apps_crDroidSettings)
- [🛡️ KernelSU Prebuilt (packages/apps/KernelSU)](https://github.com/jairorossi/android_packages_apps_KernelSU)
- [📞 Telephony (packages/services/Telephony)](https://github.com/jairorossi/android_packages_services_Telephony)
- [💬 Mms (packages/services/Mms)](https://github.com/jairorossi/android_packages_services_Mms)
- [🏗️ Build Core (build/make)](https://github.com/jairorossi/android_build)
