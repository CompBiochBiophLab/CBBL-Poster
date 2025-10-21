import qrcode
url = "https://doi.org/10.1016/j.celrep.2025.115949"
img = qrcode.make(url)
img.save("./figures/QR_CellReports2025.png")
