<p align="right"><a href="README.md">Original</a> · <strong>Português (Brasil)</strong></p>

# Runtime de áudio com FFmpeg

O Primuse usa as bibliotecas dinâmicas do FFmpeg `libavformat`, `libavcodec`, `libavutil` e `libswresample` como caminho de fallback para decodificação de formatos amplos.

- Versão: FFmpeg 8.1, `n8.1`
- Commit: `9047fa1b084f76b1b4d065af2d743df1b40dfb56`
- Upstream: <https://git.ffmpeg.org/ffmpeg.git>
- Licença: GNU Lesser General Public License 2.1 ou posterior
- Script de build: `scripts/build-ffmpeg-apple.sh`
- Smoke test do decoder: `scripts/smoke-test-ffmpeg-bridge.sh`

O build desabilita código GPL e non-free, encoders, muxers, filtros, devices, a pilha de rede do FFmpeg e decoders de vídeo. Permanecem habilitados os decoders e demuxers nativos de áudio. O resultado são XCFrameworks dinâmicos para iOS, macOS e tvOS.

O código-fonte exato e não modificado correspondente aos binários distribuídos está disponível no repositório upstream no commit indicado acima. Builds de release também devem publicar um arquivo com esse código-fonte e o script de build junto da página de download do app para cumprir o checklist da LGPL do FFmpeg.
