require 'date'

module Jekyll::Ethiopic

  def fidal(input)

    if input.respond_to?(:join) then input = input.join end

    begin
      input = input.downcase
      input = input.delete('-')

      input = input.gsub(/h{1,2}a/, 'ሀ')
      input = input.gsub(/h{1,2}u/, 'ሁ')
      input = input.gsub(/h{1,2}i/, 'ሂ')
      input = input.gsub(/h{1,2}ā/, 'ሃ')
      input = input.gsub(/h{1,2}e/, 'ሄ')
      input = input.gsub(/h{1,2}o/, 'ሆ')
      input = input.gsub(/h{1,2}[ǝə]?/, 'ህ')

      input = input.gsub(/l{1,2}a/, 'ለ')
      input = input.gsub(/l{1,2}u/, 'ሉ')
      input = input.gsub(/l{1,2}i/, 'ሊ')
      input = input.gsub(/l{1,2}ā/, 'ላ')
      input = input.gsub(/l{1,2}e/, 'ሌ')
      input = input.gsub(/l{1,2}o/, 'ሎ')
      input = input.gsub(/l{1,2}[ǝə]?/, 'ል')

      input = input.gsub(/ḥ{1,2}a/, 'ሐ')
      input = input.gsub(/ḥ{1,2}u/, 'ሑ')
      input = input.gsub(/ḥ{1,2}i/, 'ሒ')
      input = input.gsub(/ḥ{1,2}ā/, 'ሓ')
      input = input.gsub(/ḥ{1,2}e/, 'ሔ')
      input = input.gsub(/ḥ{1,2}o/, 'ሖ')
      input = input.gsub(/ḥ{1,2}[ǝə]?/, 'ሕ')
      
      input = input.gsub(/m{1,2}a/, 'መ')
      input = input.gsub(/m{1,2}u/, 'ሙ')
      input = input.gsub(/m{1,2}i/, 'ሚ')
      input = input.gsub(/m{1,2}ā/, 'ማ')
      input = input.gsub(/m{1,2}e/, 'ሜ')
      input = input.gsub(/m{1,2}o/, 'ሞ')
      input = input.gsub(/m{1,2}[ǝə]?/, 'ም')

      input = input.gsub(/ś{1,2}a/, 'ሠ')
      input = input.gsub(/ś{1,2}u/, 'ሡ')
      input = input.gsub(/ś{1,2}i/, 'ሢ')
      input = input.gsub(/ś{1,2}ā/, 'ሣ')
      input = input.gsub(/ś{1,2}e/, 'ሤ')
      input = input.gsub(/ś{1,2}o/, 'ሦ')
      input = input.gsub(/ś{1,2}[ǝə]?/, 'ሥ')

      input = input.gsub(/r{1,2}a/, 'ረ')
      input = input.gsub(/r{1,2}u/, 'ሩ')
      input = input.gsub(/r{1,2}i/, 'ሪ')
      input = input.gsub(/r{1,2}ā/, 'ራ')
      input = input.gsub(/r{1,2}e/, 'ሬ')
      input = input.gsub(/r{1,2}o/, 'ሮ')
      input = input.gsub(/r{1,2}[ǝə]?/, 'ር')

      input = input.gsub(/s{1,2}a/, 'ሰ')
      input = input.gsub(/s{1,2}u/, 'ሱ')
      input = input.gsub(/s{1,2}i/, 'ሲ')
      input = input.gsub(/s{1,2}ā/, 'ሳ')
      input = input.gsub(/s{1,2}e/, 'ሴ')
      input = input.gsub(/s{1,2}o/, 'ሶ')
      input = input.gsub(/s{1,2}[ǝə]?/, 'ስ')

      input = input.gsub(/q{1,2}ʷa/, 'ቈ')
      input = input.gsub(/q{1,2}ʷi/, 'ቊ')
      input = input.gsub(/q{1,2}ʷā/, 'ቋ')
      input = input.gsub(/q{1,2}ʷe/, 'ቌ')
      input = input.gsub(/q{1,2}ʷ[ǝə]?/, 'ቍ')

      input = input.gsub(/q{1,2}a/, 'ቀ')
      input = input.gsub(/q{1,2}u/, 'ቁ')
      input = input.gsub(/q{1,2}i/, 'ቂ')
      input = input.gsub(/q{1,2}ā/, 'ቃ')
      input = input.gsub(/q{1,2}e/, 'ቄ')
      input = input.gsub(/q{1,2}o/, 'ቆ')
      input = input.gsub(/q{1,2}[ǝə]?/, 'ቅ')

      input = input.gsub(/b{1,2}a/, 'በ')
      input = input.gsub(/b{1,2}u/, 'ቡ')
      input = input.gsub(/b{1,2}i/, 'ቢ')
      input = input.gsub(/b{1,2}ā/, 'ባ')
      input = input.gsub(/b{1,2}e/, 'ቤ')
      input = input.gsub(/b{1,2}o/, 'ቦ')
      input = input.gsub(/b{1,2}[ǝə]?/, 'ብ')

      input = input.gsub(/t{1,2}a/, 'ተ')
      input = input.gsub(/t{1,2}u/, 'ቱ')
      input = input.gsub(/t{1,2}i/, 'ቲ')
      input = input.gsub(/t{1,2}ā/, 'ታ')
      input = input.gsub(/t{1,2}e/, 'ቴ')
      input = input.gsub(/t{1,2}o/, 'ቶ')
      input = input.gsub(/t{1,2}[ǝə]?/, 'ት')

      input = input.gsub(/ḫ{1,2}ʷa/, 'ኈ')
      input = input.gsub(/ḫ{1,2}ʷi/, 'ኊ')
      input = input.gsub(/ḫ{1,2}ʷā/, 'ኋ')
      input = input.gsub(/ḫ{1,2}ʷe/, 'ኌ')
      input = input.gsub(/ḫ{1,2}ʷ[ǝə]?/, 'ኍ')

      input = input.gsub(/ḫ{1,2}a/, 'ኀ')
      input = input.gsub(/ḫ{1,2}u/, 'ኁ')
      input = input.gsub(/ḫ{1,2}i/, 'ኂ')
      input = input.gsub(/ḫ{1,2}ā/, 'ኃ')
      input = input.gsub(/ḫ{1,2}e/, 'ኄ')
      input = input.gsub(/ḫ{1,2}o/, 'ኆ')
      input = input.gsub(/ḫ{1,2}[ǝə]?/, 'ኅ')

      input = input.gsub(/n{1,2}a/, 'ነ')
      input = input.gsub(/n{1,2}u/, 'ኑ')
      input = input.gsub(/n{1,2}i/, 'ኒ')
      input = input.gsub(/n{1,2}ā/, 'ና')
      input = input.gsub(/n{1,2}e/, 'ኔ')
      input = input.gsub(/n{1,2}o/, 'ኖ')
      input = input.gsub(/n{1,2}[ǝə]?/, 'ን')

      input = input.gsub(/ʾ{1,2}a/, 'አ')
      input = input.gsub(/ʾ{1,2}u/, 'ኡ')
      input = input.gsub(/ʾ{1,2}i/, 'ኢ')
      input = input.gsub(/ʾ{1,2}ā/, 'ኣ')
      input = input.gsub(/ʾ{1,2}e/, 'ኤ')
      input = input.gsub(/ʾ{1,2}o/, 'ኦ')
      input = input.gsub(/ʾ{1,2}[ǝə]?/, 'እ')

      input = input.gsub(/k{1,2}ʷa/, 'ኰ')
      input = input.gsub(/k{1,2}ʷi/, 'ኲ')
      input = input.gsub(/k{1,2}ʷā/, 'ኳ')
      input = input.gsub(/k{1,2}ʷe/, 'ኴ')
      input = input.gsub(/k{1,2}ʷ[ǝə]?/, 'ኵ')

      input = input.gsub(/k{1,2}a/, 'ከ')
      input = input.gsub(/k{1,2}u/, 'ኩ')
      input = input.gsub(/k{1,2}i/, 'ኪ')
      input = input.gsub(/k{1,2}ā/, 'ካ')
      input = input.gsub(/k{1,2}e/, 'ኬ')
      input = input.gsub(/k{1,2}o/, 'ኮ')
      input = input.gsub(/k{1,2}[ǝə]?/, 'ክ')

      input = input.gsub(/w{1,2}a/, 'ወ')
      input = input.gsub(/w{1,2}u/, 'ዉ')
      input = input.gsub(/w{1,2}i/, 'ዊ')
      input = input.gsub(/w{1,2}ā/, 'ዋ')
      input = input.gsub(/w{1,2}e/, 'ዌ')
      input = input.gsub(/w{1,2}o/, 'ዎ')
      input = input.gsub(/w{1,2}[ǝə]?/, 'ው')

      input = input.gsub(/ʿ{1,2}a/, 'ዐ')
      input = input.gsub(/ʿ{1,2}u/, 'ዑ')
      input = input.gsub(/ʿ{1,2}i/, 'ዒ')
      input = input.gsub(/ʿ{1,2}ā/, 'ዓ')
      input = input.gsub(/ʿ{1,2}e/, 'ዔ')
      input = input.gsub(/ʿ{1,2}o/, 'ዖ')
      input = input.gsub(/ʿ{1,2}[ǝə]?/, 'ዕ')

      input = input.gsub(/z{1,2}a/, 'ዘ')
      input = input.gsub(/z{1,2}u/, 'ዙ')
      input = input.gsub(/z{1,2}i/, 'ዚ')
      input = input.gsub(/z{1,2}ā/, 'ዛ')
      input = input.gsub(/z{1,2}e/, 'ዜ')
      input = input.gsub(/z{1,2}o/, 'ዞ')
      input = input.gsub(/z{1,2}[ǝə]?/, 'ዝ')

      input = input.gsub(/y{1,2}a/, 'የ')
      input = input.gsub(/y{1,2}u/, 'ዩ')
      input = input.gsub(/y{1,2}i/, 'ዪ')
      input = input.gsub(/y{1,2}ā/, 'ያ')
      input = input.gsub(/y{1,2}e/, 'ዬ')
      input = input.gsub(/y{1,2}o/, 'ዮ')
      input = input.gsub(/y{1,2}[ǝə]?/, 'ይ')

      input = input.gsub(/d{1,2}a/, 'ደ')
      input = input.gsub(/d{1,2}u/, 'ዱ')
      input = input.gsub(/d{1,2}i/, 'ዲ')
      input = input.gsub(/d{1,2}ā/, 'ዳ')
      input = input.gsub(/d{1,2}e/, 'ዴ')
      input = input.gsub(/d{1,2}o/, 'ዶ')
      input = input.gsub(/d{1,2}[ǝə]?/, 'ድ')

      input = input.gsub(/ǧ{1,2}ā/, 'ጃ')

      input = input.gsub(/g{1,2}ʷa/, 'ጐ')
      input = input.gsub(/g{1,2}ʷi/, 'ጒ')
      input = input.gsub(/g{1,2}ʷā/, 'ጓ')
      input = input.gsub(/g{1,2}ʷe/, 'ጔ')
      input = input.gsub(/g{1,2}ʷ[ǝə]?/, 'ጕ')

      input = input.gsub(/g{1,2}a/, 'ገ')
      input = input.gsub(/g{1,2}u/, 'ጉ')
      input = input.gsub(/g{1,2}i/, 'ጊ')
      input = input.gsub(/g{1,2}ā/, 'ጋ')
      input = input.gsub(/g{1,2}e/, 'ጌ')
      input = input.gsub(/g{1,2}o/, 'ጎ')
      input = input.gsub(/g{1,2}[ǝə]?/, 'ግ')

      input = input.gsub(/ṭ{1,2}a/, 'ጠ')
      input = input.gsub(/ṭ{1,2}u/, 'ጡ')
      input = input.gsub(/ṭ{1,2}i/, 'ጢ')
      input = input.gsub(/ṭ{1,2}ā/, 'ጣ')
      input = input.gsub(/ṭ{1,2}e/, 'ጤ')
      input = input.gsub(/ṭ{1,2}o/, 'ጦ')
      input = input.gsub(/ṭ{1,2}[ǝə]?/, 'ጥ')

      input = input.gsub(/(č̣){1,2}a/, 'ጨ')

      input = input.gsub(/ṗ{1,2}a/, 'ጰ')
      input = input.gsub(/ṗ{1,2}u/, 'ጱ')
      input = input.gsub(/ṗ{1,2}i/, 'ጲ')
      input = input.gsub(/ṗ{1,2}ā/, 'ጳ')
      input = input.gsub(/ṗ{1,2}e/, 'ጴ')
      input = input.gsub(/ṗ{1,2}o/, 'ጶ')
      input = input.gsub(/ṗ{1,2}[ǝə]?/, 'ጵ')

      input = input.gsub(/ṣ{1,2}a/, 'ጸ')
      input = input.gsub(/ṣ{1,2}u/, 'ጹ')
      input = input.gsub(/ṣ{1,2}i/, 'ጺ')
      input = input.gsub(/ṣ{1,2}ā/, 'ጻ')
      input = input.gsub(/ṣ{1,2}e/, 'ጼ')
      input = input.gsub(/ṣ{1,2}o/, 'ጾ')
      input = input.gsub(/ṣ{1,2}[ǝə]?/, 'ጽ')

      input = input.gsub(/ḍ{1,2}a/, 'ፀ')
      input = input.gsub(/ḍ{1,2}u/, 'ፁ')
      input = input.gsub(/ḍ{1,2}i/, 'ፂ')
      input = input.gsub(/ḍ{1,2}ā/, 'ፃ')
      input = input.gsub(/ḍ{1,2}e/, 'ፄ')
      input = input.gsub(/ḍ{1,2}o/, 'ፆ')
      input = input.gsub(/ḍ{1,2}[ǝə]?/, 'ፅ')

      input = input.gsub(/f{1,2}a/, 'ፈ')
      input = input.gsub(/f{1,2}u/, 'ፉ')
      input = input.gsub(/f{1,2}i/, 'ፊ')
      input = input.gsub(/f{1,2}ā/, 'ፋ')
      input = input.gsub(/f{1,2}e/, 'ፌ')
      input = input.gsub(/f{1,2}o/, 'ፎ')
      input = input.gsub(/f{1,2}[ǝə]?/, 'ፍ')

      input = input.gsub(/p{1,2}a/, 'ፐ')
      input = input.gsub(/p{1,2}u/, 'ፑ')
      input = input.gsub(/p{1,2}i/, 'ፒ')
      input = input.gsub(/p{1,2}ā/, 'ፓ')
      input = input.gsub(/p{1,2}e/, 'ፔ')
      input = input.gsub(/p{1,2}o/, 'ፖ')
      input = input.gsub(/p{1,2}[ǝə]?/, 'ፕ')

      input = input.gsub(/(\s)/, '፡\1')
      input = input.gsub(/(\b)$/, '፡')
    rescue
    end
    
    input

  end

  def monthday_to_string_ethiopic(input)

    unless input == '/'

      input = input.split('/')
      
      day = input[0]
      month = input[1].to_i-1 # zero-based

      name = %w{Maskaram Ṭəqəmt Ḫədār Tāḫśāś Ṭərr Yakkātit Maggābit Miyāzyā Gənbot Sane Ḥamle Naḥase Ṗāgʷəmen}

      "#{day} #{name[month]}"

    end

  end

  def to_ethiopic(input)

    d = Date.parse(input.to_s)

    jdn = d.ajd.to_f

    r = (jdn - 1723855.5) % 1461
    n = (r % 365) + 365 * (r / 1460).floor

    year = 4 * ((jdn - 1723856) / 1461).floor + (r / 365).floor - (r / 1460).floor
    month = (n / 30).floor # zero-based
    day = (n % 30) + 1

    name = %w{Maskaram Ṭəqəmt Ḫədār Tāḫśāś Ṭərr Yakkātit Maggābit Miyāzyā Gənbot Sane Ḥamle Naḥase Ṗāgʷəmen}

    "#{day.round} #{name[month]} #{year}"

  end

end

Liquid::Template.register_filter(Jekyll::Ethiopic)