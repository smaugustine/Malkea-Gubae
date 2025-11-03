require 'date'

module Jekyll::Ethiopic

  def fidal(input)

    if input.respond_to?(:join) then input = input.join end
    if input.respond_to?(:to_s) then input = input.to_s end

    input = input.downcase
    input = input.delete('-')

    input = input.gsub(/h{1,2}a/, 'ሀ')
    input = input.gsub(/h{1,2}u/, 'ሁ')
    input = input.gsub(/h{1,2}i/, 'ሂ')
    input = input.gsub(/h{1,2}ā/, 'ሃ')
    input = input.gsub(/h{1,2}e/, 'ሄ')
    input = input.gsub(/h{1,2}o/, 'ሆ')
    input = input.gsub(/h{1,2}[ǝə]?/, 'ህ')

    input = input.gsub(/l{1,2}ʷā/, 'ሏ')
    input = input.gsub(/l{1,2}a/, 'ለ')
    input = input.gsub(/l{1,2}u/, 'ሉ')
    input = input.gsub(/l{1,2}i/, 'ሊ')
    input = input.gsub(/l{1,2}ā/, 'ላ')
    input = input.gsub(/l{1,2}e/, 'ሌ')
    input = input.gsub(/l{1,2}o/, 'ሎ')
    input = input.gsub(/l{1,2}[ǝə]?/, 'ል')

    input = input.gsub(/ḥ{1,2}ʷā/, 'ሗ')
    input = input.gsub(/ḥ{1,2}a/, 'ሐ')
    input = input.gsub(/ḥ{1,2}u/, 'ሑ')
    input = input.gsub(/ḥ{1,2}i/, 'ሒ')
    input = input.gsub(/ḥ{1,2}ā/, 'ሓ')
    input = input.gsub(/ḥ{1,2}e/, 'ሔ')
    input = input.gsub(/ḥ{1,2}o/, 'ሖ')
    input = input.gsub(/ḥ{1,2}[ǝə]?/, 'ሕ')
    
    input = input.gsub(/m{1,2}ʷā/, 'ሟ')
    input = input.gsub(/m{1,2}a/, 'መ')
    input = input.gsub(/m{1,2}u/, 'ሙ')
    input = input.gsub(/m{1,2}i/, 'ሚ')
    input = input.gsub(/m{1,2}ā/, 'ማ')
    input = input.gsub(/m{1,2}e/, 'ሜ')
    input = input.gsub(/m{1,2}o/, 'ሞ')
    input = input.gsub(/m{1,2}[ǝə]?/, 'ም')

    input = input.gsub(/ś{1,2}ʷā/, 'ሧ')
    input = input.gsub(/ś{1,2}a/, 'ሠ')
    input = input.gsub(/ś{1,2}u/, 'ሡ')
    input = input.gsub(/ś{1,2}i/, 'ሢ')
    input = input.gsub(/ś{1,2}ā/, 'ሣ')
    input = input.gsub(/ś{1,2}e/, 'ሤ')
    input = input.gsub(/ś{1,2}o/, 'ሦ')
    input = input.gsub(/ś{1,2}[ǝə]?/, 'ሥ')

    input = input.gsub(/r{1,2}ʷā/, 'ሯ')
    input = input.gsub(/r{1,2}a/, 'ረ')
    input = input.gsub(/r{1,2}u/, 'ሩ')
    input = input.gsub(/r{1,2}i/, 'ሪ')
    input = input.gsub(/r{1,2}ā/, 'ራ')
    input = input.gsub(/r{1,2}e/, 'ሬ')
    input = input.gsub(/r{1,2}o/, 'ሮ')
    input = input.gsub(/r{1,2}[ǝə]?/, 'ር')

    input = input.gsub(/s{1,2}ʷā/, 'ሷ')
    input = input.gsub(/s{1,2}a/, 'ሰ')
    input = input.gsub(/s{1,2}u/, 'ሱ')
    input = input.gsub(/s{1,2}i/, 'ሲ')
    input = input.gsub(/s{1,2}ā/, 'ሳ')
    input = input.gsub(/s{1,2}e/, 'ሴ')
    input = input.gsub(/s{1,2}o/, 'ሶ')
    input = input.gsub(/s{1,2}[ǝə]?/, 'ስ')

    input = input.gsub(/š{1,2}ʷā/, 'ሿ')
    input = input.gsub(/š{1,2}a/, 'ሸ')
    input = input.gsub(/š{1,2}u/, 'ሹ')
    input = input.gsub(/š{1,2}i/, 'ሺ')
    input = input.gsub(/š{1,2}ā/, 'ሻ')
    input = input.gsub(/š{1,2}e/, 'ሼ')
    input = input.gsub(/š{1,2}o/, 'ሾ')
    input = input.gsub(/š{1,2}[ǝə]?/, 'ሽ')

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

    input = input.gsub(/(q̱){1,2}ʷa/, 'ቘ')
    input = input.gsub(/(q̱){1,2}ʷi/, 'ቚ')
    input = input.gsub(/(q̱){1,2}ʷā/, 'ቛ')
    input = input.gsub(/(q̱){1,2}ʷe/, 'ቜ')
    input = input.gsub(/(q̱){1,2}ʷ[ǝə]?/, 'ቝ')

    input = input.gsub(/(q̱){1,2}a/, 'ቐ')
    input = input.gsub(/(q̱){1,2}u/, 'ቑ')
    input = input.gsub(/(q̱){1,2}i/, 'ቒ')
    input = input.gsub(/(q̱){1,2}ā/, 'ቓ')
    input = input.gsub(/(q̱){1,2}e/, 'ቔ')
    input = input.gsub(/(q̱){1,2}o/, 'ቖ')
    input = input.gsub(/(q̱){1,2}[ǝə]?/, 'ቕ')

    input = input.gsub(/b{1,2}ʷā/, 'ቧ')
    input = input.gsub(/b{1,2}a/, 'በ')
    input = input.gsub(/b{1,2}u/, 'ቡ')
    input = input.gsub(/b{1,2}i/, 'ቢ')
    input = input.gsub(/b{1,2}ā/, 'ባ')
    input = input.gsub(/b{1,2}e/, 'ቤ')
    input = input.gsub(/b{1,2}o/, 'ቦ')
    input = input.gsub(/b{1,2}[ǝə]?/, 'ብ')

    input = input.gsub(/v{1,2}ʷā/, 'ቯ')
    input = input.gsub(/v{1,2}a/, 'ቨ')
    input = input.gsub(/v{1,2}u/, 'ቩ')
    input = input.gsub(/v{1,2}i/, 'ቪ')
    input = input.gsub(/v{1,2}ā/, 'ቫ')
    input = input.gsub(/v{1,2}e/, 'ቬ')
    input = input.gsub(/v{1,2}o/, 'ቮ')
    input = input.gsub(/v{1,2}[ǝə]?/, 'ቭ')

    input = input.gsub(/t{1,2}ʷā/, 'ቷ')
    input = input.gsub(/t{1,2}a/, 'ተ')
    input = input.gsub(/t{1,2}u/, 'ቱ')
    input = input.gsub(/t{1,2}i/, 'ቲ')
    input = input.gsub(/t{1,2}ā/, 'ታ')
    input = input.gsub(/t{1,2}e/, 'ቴ')
    input = input.gsub(/t{1,2}o/, 'ቶ')
    input = input.gsub(/t{1,2}[ǝə]?/, 'ት')

    # ጨ before ቸ to prevent conflicts
    input = input.gsub(/(č̣){1,2}ʷā/, 'ጯ')
    input = input.gsub(/(č̣){1,2}a/, 'ጨ')
    input = input.gsub(/(č̣){1,2}u/, 'ጩ')
    input = input.gsub(/(č̣){1,2}i/, 'ጪ')
    input = input.gsub(/(č̣){1,2}ā/, 'ጫ')
    input = input.gsub(/(č̣){1,2}e/, 'ጬ')
    input = input.gsub(/(č̣){1,2}o/, 'ጮ')
    input = input.gsub(/(č̣){1,2}[ǝə]?/, 'ጭ')

    input = input.gsub(/č{1,2}ʷā/, 'ቿ')
    input = input.gsub(/č{1,2}a/, 'ቸ')
    input = input.gsub(/č{1,2}u/, 'ቹ')
    input = input.gsub(/č{1,2}i/, 'ቺ')
    input = input.gsub(/č{1,2}ā/, 'ቻ')
    input = input.gsub(/č{1,2}e/, 'ቼ')
    input = input.gsub(/č{1,2}o/, 'ቾ')
    input = input.gsub(/č{1,2}[ǝə]?/, 'ች')

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

    input = input.gsub(/n{1,2}ʷā/, 'ኗ')
    input = input.gsub(/n{1,2}a/, 'ነ')
    input = input.gsub(/n{1,2}u/, 'ኑ')
    input = input.gsub(/n{1,2}i/, 'ኒ')
    input = input.gsub(/n{1,2}ā/, 'ና')
    input = input.gsub(/n{1,2}e/, 'ኔ')
    input = input.gsub(/n{1,2}o/, 'ኖ')
    input = input.gsub(/n{1,2}[ǝə]?/, 'ን')

    input = input.gsub(/ñ{1,2}ʷā/, 'ኟ')
    input = input.gsub(/ñ{1,2}a/, 'ኘ')
    input = input.gsub(/ñ{1,2}u/, 'ኙ')
    input = input.gsub(/ñ{1,2}i/, 'ኚ')
    input = input.gsub(/ñ{1,2}ā/, 'ኛ')
    input = input.gsub(/ñ{1,2}e/, 'ኜ')
    input = input.gsub(/ñ{1,2}o/, 'ኞ')
    input = input.gsub(/ñ{1,2}[ǝə]?/, 'ኝ')

    input = input.gsub(/ʾ{1,2}ʷā/, 'ኧ')
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

    input = input.gsub(/z{1,2}ʷā/, 'ዟ')
    input = input.gsub(/z{1,2}a/, 'ዘ')
    input = input.gsub(/z{1,2}u/, 'ዙ')
    input = input.gsub(/z{1,2}i/, 'ዚ')
    input = input.gsub(/z{1,2}ā/, 'ዛ')
    input = input.gsub(/z{1,2}e/, 'ዜ')
    input = input.gsub(/z{1,2}o/, 'ዞ')
    input = input.gsub(/z{1,2}[ǝə]?/, 'ዝ')

    input = input.gsub(/ž{1,2}ʷā/, 'ዧ')
    input = input.gsub(/ž{1,2}a/, 'ዠ')
    input = input.gsub(/ž{1,2}u/, 'ዡ')
    input = input.gsub(/ž{1,2}i/, 'ዢ')
    input = input.gsub(/ž{1,2}ā/, 'ዣ')
    input = input.gsub(/ž{1,2}e/, 'ዤ')
    input = input.gsub(/ž{1,2}o/, 'ዦ')
    input = input.gsub(/ž{1,2}[ǝə]?/, 'ዥ')

    input = input.gsub(/y{1,2}a/, 'የ')
    input = input.gsub(/y{1,2}u/, 'ዩ')
    input = input.gsub(/y{1,2}i/, 'ዪ')
    input = input.gsub(/y{1,2}ā/, 'ያ')
    input = input.gsub(/y{1,2}e/, 'ዬ')
    input = input.gsub(/y{1,2}o/, 'ዮ')
    input = input.gsub(/y{1,2}[ǝə]?/, 'ይ')

    input = input.gsub(/d{1,2}ʷā/, 'ዷ')
    input = input.gsub(/d{1,2}a/, 'ደ')
    input = input.gsub(/d{1,2}u/, 'ዱ')
    input = input.gsub(/d{1,2}i/, 'ዲ')
    input = input.gsub(/d{1,2}ā/, 'ዳ')
    input = input.gsub(/d{1,2}e/, 'ዴ')
    input = input.gsub(/d{1,2}o/, 'ዶ')
    input = input.gsub(/d{1,2}[ǝə]?/, 'ድ')

    input = input.gsub(/ǧ{1,2}ʷā/, 'ጇ')
    input = input.gsub(/ǧ{1,2}a/, 'ጀ')
    input = input.gsub(/ǧ{1,2}u/, 'ጁ')
    input = input.gsub(/ǧ{1,2}i/, 'ጂ')
    input = input.gsub(/ǧ{1,2}ā/, 'ጃ')
    input = input.gsub(/ǧ{1,2}e/, 'ጄ')
    input = input.gsub(/ǧ{1,2}o/, 'ጆ')
    input = input.gsub(/ǧ{1,2}[ǝə]?/, 'ጅ')

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

    input = input.gsub(/ṭ{1,2}ʷā/, 'ጧ')
    input = input.gsub(/ṭ{1,2}a/, 'ጠ')
    input = input.gsub(/ṭ{1,2}u/, 'ጡ')
    input = input.gsub(/ṭ{1,2}i/, 'ጢ')
    input = input.gsub(/ṭ{1,2}ā/, 'ጣ')
    input = input.gsub(/ṭ{1,2}e/, 'ጤ')
    input = input.gsub(/ṭ{1,2}o/, 'ጦ')
    input = input.gsub(/ṭ{1,2}[ǝə]?/, 'ጥ')

    # ጨ is placed above to prevent conflict with ቸ

    input = input.gsub(/ṗ{1,2}ʷā/, 'ጷ')
    input = input.gsub(/ṗ{1,2}a/, 'ጰ')
    input = input.gsub(/ṗ{1,2}u/, 'ጱ')
    input = input.gsub(/ṗ{1,2}i/, 'ጲ')
    input = input.gsub(/ṗ{1,2}ā/, 'ጳ')
    input = input.gsub(/ṗ{1,2}e/, 'ጴ')
    input = input.gsub(/ṗ{1,2}o/, 'ጶ')
    input = input.gsub(/ṗ{1,2}[ǝə]?/, 'ጵ')

    input = input.gsub(/ṣ{1,2}ʷā/, 'ጿ')
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

    input = input.gsub(/f{1,2}ʷā/, 'ፏ')
    input = input.gsub(/f{1,2}a/, 'ፈ')
    input = input.gsub(/f{1,2}u/, 'ፉ')
    input = input.gsub(/f{1,2}i/, 'ፊ')
    input = input.gsub(/f{1,2}ā/, 'ፋ')
    input = input.gsub(/f{1,2}e/, 'ፌ')
    input = input.gsub(/f{1,2}o/, 'ፎ')
    input = input.gsub(/f{1,2}[ǝə]?/, 'ፍ')

    input = input.gsub(/p{1,2}ʷā/, 'ፗ')
    input = input.gsub(/p{1,2}a/, 'ፐ')
    input = input.gsub(/p{1,2}u/, 'ፑ')
    input = input.gsub(/p{1,2}i/, 'ፒ')
    input = input.gsub(/p{1,2}ā/, 'ፓ')
    input = input.gsub(/p{1,2}e/, 'ፔ')
    input = input.gsub(/p{1,2}o/, 'ፖ')
    input = input.gsub(/p{1,2}[ǝə]?/, 'ፕ')

    input = input.gsub(/1(?=\d{2})/, '፻')
    input = input.gsub(/2(?=\d{2})/, '፪፻')
    input = input.gsub(/3(?=\d{2})/, '፫፻')
    input = input.gsub(/4(?=\d{2})/, '፬፻')
    input = input.gsub(/5(?=\d{2})/, '፭፻')
    input = input.gsub(/6(?=\d{2})/, '፮፻')
    input = input.gsub(/7(?=\d{2})/, '፯፻')
    input = input.gsub(/8(?=\d{2})/, '፰፻')
    input = input.gsub(/9(?=\d{2})/, '፱፻')

    input = input.gsub(/1(?=\d{1})/, '፲')
    input = input.gsub(/2(?=\d{1})/, '፳')
    input = input.gsub(/3(?=\d{1})/, '፴')
    input = input.gsub(/4(?=\d{1})/, '፵')
    input = input.gsub(/5(?=\d{1})/, '፶')
    input = input.gsub(/6(?=\d{1})/, '፷')
    input = input.gsub(/7(?=\d{1})/, '፸')
    input = input.gsub(/8(?=\d{1})/, '፹')
    input = input.gsub(/9(?=\d{1})/, '፺')
    
    input = input.gsub(/1/, '፩')
    input = input.gsub(/2/, '፪')
    input = input.gsub(/3/, '፫')
    input = input.gsub(/4/, '፬')
    input = input.gsub(/5/, '፭')
    input = input.gsub(/6/, '፮')
    input = input.gsub(/7/, '፯')
    input = input.gsub(/8/, '፰')
    input = input.gsub(/9/, '፱')
    input = input.gsub(/0/, '')

    input = input.gsub(/(\s)/, '፡\1')
    input = input.gsub(/(\b)$/, '፡')
    input = input.gsub(/(\]|\))$/, '፡\1')

    input

  end

  def escape_ethiopic(input)

    if input.respond_to?(:to_s) then input = input.to_s end

    input = input.downcase
    input = input.delete('-')

    input = input.gsub(/[ā]/, 'a')
    input = input.gsub(/[č]/, 'c')
    input = input.gsub(/(č̣)/, 'c')
    input = input.gsub(/[ǝəƎ]/, 'e')
    input = input.gsub(/[ǧ]/, 'g')
    input = input.gsub(/[ḥḫ]/, 'h')
    input = input.gsub(/[ñ]/, 'n')
    input = input.gsub(/[ṗ]/, 'p')
    input = input.gsub(/[śṣḍš]/, 's')
    input = input.gsub(/[ṭ]/, 't')
    input = input.gsub(/[ʾʿ]/, '')
    input = input.gsub(/[ʷ]/, 'w')
    input = input.gsub(/[\s]/, '-')

    input

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

  def to_gregorian(input)

    y = Integer(input.split("-")[0])
    m = Integer(input.split("-")[1])
    d = Integer(input.split("-")[2])

    n = 30 * m + d - 31

    jdn = (1723856 + 365) + 365 * (y - 1) + (y / 4).floor + n

    Date.jd(jdn)

  end

  def camelize(input)
    skip = %w{and or}

    input.split(' ').map{ |word| unless skip.include? word then word.capitalize else word end }.join(' ')
  end

  def flatten(input)
    if input.respond_to?(:flatten) then return input.flatten end
  end

  def sort_numeric(input)

    return input.sort do |a,b|
      if a.to_i != b.to_i
        a.to_i <=> b.to_i
      elsif a.to_i.to_s == a.to_s
        -1
      elsif b.to_i.to_s == b.to_s
        1
      else
        a.gsub(/\d/, "") <=> b.gsub(/\d/, "")
      end
    end

  end

end

Liquid::Template.register_filter(Jekyll::Ethiopic)