# db/seeds.rb
PrefectureCode.destroy_all
SoukoZaiko.destroy_all
# Sample data for prefecture_codes
# Add PrefectureCode data
prefecture_data = [
  { code: '01', name: '北海道', ew_flag: '東' },
  { code: '02', name: '青森県', ew_flag: '東' },
  { code: '03', name: '岩手県', ew_flag: '東' },
  { code: '04', name: '宮城県', ew_flag: '東' },
  { code: '05', name: '秋田県', ew_flag: '東' },
  { code: '06', name: '山形県', ew_flag: '東' },
  { code: '07', name: '福島県', ew_flag: '東' },
  { code: '08', name: '茨城県', ew_flag: '東' },
  { code: '09', name: '栃木県', ew_flag: '東' },
  { code: '10', name: '群馬県', ew_flag: '東' },
  { code: '11', name: '埼玉県', ew_flag: '東' },
  { code: '12', name: '千葉県', ew_flag: '東' },
  { code: '13', name: '東京都', ew_flag: '東' },
  { code: '14', name: '神奈川県', ew_flag: '東' },
  { code: '15', name: '新潟県', ew_flag: '西' },
  { code: '16', name: '富山県', ew_flag: '西' },
  { code: '17', name: '石川県', ew_flag: '西' },
  { code: '18', name: '福井県', ew_flag: '西' },
  { code: '19', name: '山梨県', ew_flag: '東' },
  { code: '20', name: '長野県', ew_flag: '西' },
  { code: '21', name: '岐阜県', ew_flag: '西' },
  { code: '22', name: '静岡県', ew_flag: '西' },
  { code: '23', name: '愛知県', ew_flag: '西' },
  { code: '24', name: '三重県', ew_flag: '西' },
  { code: '25', name: '滋賀県', ew_flag: '西' },
  { code: '26', name: '京都府', ew_flag: '西' },
  { code: '27', name: '大阪府', ew_flag: '西' },
  { code: '28', name: '兵庫県', ew_flag: '西' },
  { code: '29', name: '奈良県', ew_flag: '西' },
  { code: '30', name: '和歌山県', ew_flag: '西' },
  { code: '31', name: '鳥取県', ew_flag: '西' },
  { code: '32', name: '島根県', ew_flag: '西' },
  { code: '33', name: '岡山県', ew_flag: '西' },
  { code: '34', name: '広島県', ew_flag: '西' },
  { code: '35', name: '山口県', ew_flag: '西' },
  { code: '36', name: '徳島県', ew_flag: '西' },
  { code: '37', name: '香川県', ew_flag: '西' },
  { code: '38', name: '愛媛県', ew_flag: '西' },
  { code: '39', name: '高知県', ew_flag: '西' },
  { code: '40', name: '福岡県', ew_flag: '西' },
  { code: '41', name: '佐賀県', ew_flag: '西' },
  { code: '42', name: '長崎県', ew_flag: '西' },
  { code: '43', name: '熊本県', ew_flag: '西' },
  { code: '44', name: '大分県', ew_flag: '西' },
  { code: '45', name: '宮崎県', ew_flag: '西' },
  { code: '46', name: '鹿児島県', ew_flag: '西' },
  { code: '47', name: '沖縄県', ew_flag: '西' }
]

prefecture_data.each do |data|
  PrefectureCode.create!(data)
end

# Add SoukoZaiko data with references to PrefectureCode
souko_zaiko_data = [
  { warehouse_code: 'EAST', sku_code: 'SKU0001', stock_type: '01', stock: 10, prefecture_code: PrefectureCode.find_by(code: '01') },
  { warehouse_code: 'WEST', sku_code: 'SKU0001', stock_type: '01', stock: 15, prefecture_code: PrefectureCode.find_by(code: '02') },
  { warehouse_code: 'EAST', sku_code: 'SKU0002', stock_type: '01', stock: 10, prefecture_code: PrefectureCode.find_by(code: '03') },
  { warehouse_code: 'WEST', sku_code: 'SKU0002', stock_type: '01', stock: 20, prefecture_code: PrefectureCode.find_by(code: '04') },
  { warehouse_code: 'EAST', sku_code: 'SKU0003', stock_type: '01', stock: 1, prefecture_code: PrefectureCode.find_by(code: '05') },
  { warehouse_code: 'WEST', sku_code: 'SKU0003', stock_type: '01', stock: 1, prefecture_code: PrefectureCode.find_by(code: '06') },
  { warehouse_code: 'EAST', sku_code: 'SKU0004', stock_type: '01', stock: 5, prefecture_code: PrefectureCode.find_by(code: '07') },
  { warehouse_code: 'WEST', sku_code: 'SKU0004', stock_type: '01', stock: 5, prefecture_code: PrefectureCode.find_by(code: '08') },
  { warehouse_code: 'EAST', sku_code: 'SKU0005', stock_type: '01', stock: 10, prefecture_code: PrefectureCode.find_by(code: '09') },
  { warehouse_code: 'WEST', sku_code: 'SKU0005', stock_type: '01', stock: 0, prefecture_code: PrefectureCode.find_by(code: '10') },
  { warehouse_code: 'EAST', sku_code: 'SKU0005', stock_type: '02', stock: 0, prefecture_code: PrefectureCode.find_by(code: '11') },
  { warehouse_code: 'WEST', sku_code: 'SKU0005', stock_type: '02', stock: 0, prefecture_code: PrefectureCode.find_by(code: '12') }
]

souko_zaiko_data.each do |data|
  SoukoZaiko.create!(data)
end