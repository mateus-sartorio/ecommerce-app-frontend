import { Box } from "@mui/material";
import style from "./style.module.css";

export default function PixPayment() {
  return (
    <Box component="form" sx={{ "& > :not(style)": { m: 1, width: "90%" } }} noValidate autoComplete="on">
      <div className={style["pix-box"]}>Quadrado com o qrcode</div>

      <p>Abra o aplicativo ou Internet Banking para pagar Na opção Pix, escolha 'Ler QR Code'</p>
      <p>Leia o QR Code ou, se preferir, copie o código para Pix Copia e Cola.</p>
      <p>Revise as informações e confirme o pagamento.</p>
      <p></p>
    </Box>
  );
}
