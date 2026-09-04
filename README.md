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

## 📥 Guia de Instalação no Celular (Flashing Guide)

### 📋 Arquivos Necessários:
1. **Recovery:** [OrangeFox Recovery](https://orangefox.download/device/raphael) com suporte a Retrofit Dynamic Partitions.
2. **Script Retrofit Dynamic:** `legacy to retrofit dynamic by @raphael_alpha.zip`
3. **Firmware:** Firmware MIUI Global V12.5.2.0 (`fw_raphael_miui_RAPHAELGlobal_V12.5.2.0.RFKMIXM_edbf5f63e8_11.0.zip`).
4. **ROM:** `crDroidAndroid-13.0-*-raphael-v9.20.zip` ([Download no Gofile](https://gofile.io/d/p5suslGb)).
5. **GApps (Opcional):** [NikGapps](https://nikgapps.com/) (Basic/Core para Android 13) - caso queira serviços Google e Play Store.
6. **DFE (Opcional):** `Disable_Dm-Verity_ForceEncrypt.zip` (se desejar manter a memória interna sem criptografia).

---

### 📲 Passo a Passo de Instalação Manual (OrangeFox / TWRP):

#### Passo 1: Converter para Partições Dinâmicas (Retrofit)
1. Reinicie no **OrangeFox Recovery**.
2. Vá em **Install** e instale o arquivo `legacy to retrofit dynamic by @raphael_alpha.zip`.
3. Vá em **Wipe > Advanced Wipe** e marque:
   - [X] Dalvik / ART Cache
   - [X] Cache
   - [X] Data
   - [X] Metadata
4. Arraste para confirmar o Wipe.
5. Vá no menu principal > **Reboot > Recovery** (⚠️ **Obrigatório reiniciar o Recovery antes de continuar!**).

#### Passo 2: Instalar Firmware e ROM
1. Quando o Recovery reiniciar, vá em **Install**.
2. Instale o **Firmware MIUI 12.5.2 Global**.
3. Em seguida, instale o arquivo da **ROM crDroid Raphael Edition (`.zip`)**.

#### Passo 3: GApps e DFE (Opcionais)
1. *(Opcional)* Se desejar os serviços do Google, instale o **NikGapps**.
2. *(Opcional)* Se não quiser encriptação forçada, instale o **Disable_Dm-Verity_ForceEncrypt.zip**.

#### Passo 4: Format Data e Inicialização
1. Vá em **Wipe > Format Data**.
2. Digite `yes` e confirme no botão verde.
3. Toque em **Reboot System** e aproveite sua **crDroid Raphael Edition**!

> 💡 **Dica de Instalação Rápida via PC:** Na pasta [`tools/`](./tools) você encontra o script `flash_raphael.bat` que automatiza todos esses envios via ADB Sideload automaticamente pelo computador!

---

## 🛠️ Como Compilar a ROM em Qualquer Servidor (Build Guide)

### 1. Instalar dependências no Ubuntu 22.04 / 24.04:
```bash
sudo apt update && sudo apt install -y bc bison build-essential ccache curl flex g++-multilib gcc-multilib git git-lfs gnupg gperf imagemagick lib32readline-dev lib32z1-dev libelf-dev liblz4-tool libncurses5 libncurses5-dev libsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev python3 openjdk-11-jdk
```

### 2. Instalar o utilitário `repo`:
```bash
mkdir -p ~/.bin && curl https://storage.googleapis.com/git-repo-downloads/repo > ~/.bin/repo && chmod a+x ~/.bin/repo && export PATH=~/.bin:$PATH
```

### 3. Inicializar a árvore do crDroid 13:
```bash
mkdir -p /mnt/android && cd /mnt/android
repo init -u https://github.com/crdroidandroid/android.git -b 13.0 --git-lfs
```

### 4. Puxar os Manifestos Customizados desta Edição:
```bash
git clone https://github.com/jairorossi/crDroid-Raphael-Edition.git .repo/local_manifests
```

### 5. Sincronizar os Repositórios:
```bash
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
```

### 6. Aplicar os Patches no Framework:
```bash
cd /mnt/android/frameworks/base
git am /mnt/android/.repo/local_manifests/patches/*.patch || true
cd /mnt/android
```

### 7. Iniciar a Compilação:
```bash
source build/envsetup.sh
brunch raphael
```

Ao finalizar, a ROM flashável estará pronta em:
`/mnt/android/out/target/product/raphael/crDroidAndroid-13.0-*-raphael-v9.20.zip`

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
