-- program sederhana di lua

-- fungsi untuk menampilkan menu
function TampilkanMenu()
    print("===== Selamat Datang di Kalkulator Sederhana =====")
    print("1. Penjumlahan")
    print("2. Pengurangan")
    print("3. Perkalian")
    print("4. Pembagian")
    print("5. Keluar")
    io.write("Pilih menu : (1-5)\n")
end

-- fungsi untuk mendapatkan nomor dari input
function GetNomor(nomorPilihan)
    while true do
        io.write(nomorPilihan)
        local input = io.read()
        local nomor = tonumber(input)
        if nomor then
            return nomor
        else
            print("Input harus berupa angka")
        end
    end
end

-- fungsi untuk mencetak pembagian dengan opsi
function PembagianOutput()
    print("\nPilih format pembagian :")
    print("1. Pembagian Bulat")
    print("2. Pembagian Desimal")
    io.write("Pilih format pembagian : (1-2)\n")
    while true do
        local pilihan = tonumber(io.read())
        if pilihan == 1 or pilihan == 2 then
            return pilihan
        else
            print("Pilihan Tidak Valid, Coba Lagi")
            print("Pilih format pembagian : (1-2)")
        end
    end
end

-- fungsi untuk melakukan perhitungan berdasarkan pilihan input
function Hitung(pilihan)
    local nomor1 = GetNomor("Masukkan angka pertama : ")
    local nomor2 = GetNomor("Masukkan angka kedua : ")
    local hasil

    if pilihan == 1 then
        hasil = nomor1 + nomor2
        print(string.format("Hasil dari %d + %d = %d", nomor1, nomor2, hasil))
    elseif pilihan == 2 then
        hasil = nomor1 - nomor2
        print(string.format("Hasil dari %d - %d = %d", nomor1, nomor2, hasil))
    elseif pilihan == 3 then
        hasil = nomor1 * nomor2
        print(string.format("Hasil dari %d * %d = %d", nomor1, nomor2, hasil))
    elseif pilihan == 4 then
        if nomor2 == 0 then
            print("Tidak bisa membagi dengan 0")
        else
            local pilihanPembagian = PembagianOutput()
            if pilihanPembagian == 1 then
                -- pembagian bulat
                hasil = nomor1 / nomor2
                print(string.format("Hasil dari %d / %d = %d", nomor1, nomor2, math.floor(hasil)))
            else
                -- pembagian desimal
                hasil = nomor1 / nomor2
                print(string.format("Hasil dari %d / %d = %.3f", nomor1, nomor2, hasil))
            end
        end
    else
        print("Pilihan Tidak Valid, Coba Lagi")
    end
end

-- fungsi utama
while true do
    TampilkanMenu()
    local pilihan = tonumber(io.read())

    if pilihan == 5 then
        print("Terima kasih telah menggunakan kalkulator sederhana")
        break
    elseif pilihan >=1 and pilihan <=4 then
        Hitung(pilihan)
    else
        print("Pilihan Tidak Valid, Coba Lagi")
    end

    print("\n")
end