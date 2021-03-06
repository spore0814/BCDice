# frozen_string_literal: true

module BCDice
  module GameSystem
    class FilledWith < Base
      # 夢幻の迷宮エネミーデータ表
      def fetch_enemy_data(command)
        m = /^RED([ENHLX])(256|265|465|665|666|[1-6]4[1-6])$/.match(command)
        unless m
          return nil
        end

        difficulty = Difficulty.new(m[1])
        key = m[2]
        area_name = AREA_LIST[key[0].to_i - 1]

        chosen = ENEMY_DATA[key][difficulty.index]

        return "エネミーデータ表(#{key}):#{area_name}<#{difficulty.name}>:#{chosen}"
      end

      AREA_LIST = [
        "洞窟",
        "遺跡",
        "山岳",
        "水辺",
        "森林",
        "墓場",
      ].freeze

      ENEMY_DATA = {
        "141" => [
          "キャンディークラウン(CL40)1匹",
          "キャンディクラウン(CL40)「1D-3」匹(最低1匹)",
          "キャンディークラウン「1D-2」匹(最低1匹)出目が6だった場合ゴールデンクラウン(CL177)1匹",
          "ゴールデンクラウン(CL177)とエンカウント",
          "キャンディークラウン(CL40/オリジン)1匹"
        ],
        "142" => [
          "ベルセルク(CL7)3匹",
          "ベルセルク(CL7)3匹(〔命中〕+4、〔HP〕+30、〔FP〕+10、あらゆる致傷力+20)",
          "ベルセルク(CL7)3匹(〔命中〕+8、〔HP〕+60、〔FP〕+20、あらゆる致傷力+40)",
          "ベルセルク(CL7)3匹(〔命中〕+16、〔HP〕+120、〔FP〕+40、あらゆる致傷力+80)",
          "ベルセルク(CL7/オリジン)3匹(〔HP〕+500、あらゆる致傷力+100)"
        ],
        "143" => [
          "ガーゴイル(CL10)2匹",
          "ガーゴイル(CL10)2匹(〔命中〕+4、〔HP〕+20、〔FP〕+10、あらゆる致傷力と防護点+20)",
          "ガーゴイル(CL10)2匹(〔命中〕+8、〔HP〕+40、〔FP〕+20、あらゆる致傷力と防護点+40)",
          "ザッハーク(CL39)3匹",
          "ガーゴイル(CL10/オリジン)2匹(〔HP〕+500、あらゆる致傷力と防護点+100)"
        ],
        "144" => [
          "デビルホイール(CL18)1匹",
          "デビルホイール(CL18)1匹、あらゆる致傷力+20",
          "デビルホイール(CL18)1匹、あらゆる致傷力+40",
          "ムスペルヘイムの獣(CL65)、あらゆる防護点+20",
          "デビルホイール(CL18/オリジン)1匹(〔HP〕+1000、あらゆる致傷力+100)"
        ],
        "145" => [
          "ヘルハウンド(CL12)1匹、インプ(CL3)2匹",
          "フェニックス(CL25)2匹",
          "火龍ヘルブレイザー(CL50)1匹、ケルベロス(CL33)1匹",
          "煉獄龍バーガトリ(CL100)1匹",
          "ヘルハウンド(CL12/オリジン)1匹、インプ(CL3/オリジン)2匹(〔HP〕+500、あらゆる致傷力+100)"
        ],
        "146" => [
          "アイスメイデン(CL10)1匹、アイスリザード(CL7)2匹",
          "クリスタルビースト(CL25)2匹",
          "氷河龍グレイシャル(CL65)1匹",
          "冥界龍コキュートス(CL110)1匹",
          "アイスメイデン(CL10/オリジン)1匹、アイスリザード(CL7/オリジン)2匹(〔HP〕+500、あらゆる致傷力+100)"
        ],
        "241" => [
          "スケルトン(CL3)、アルテミス(CL8)、スターゲイザー(CL10)、ヤシャ(CL10)、ヘルハウンド(CL12)、ゴーレム(CL13)",
          "ナイトスケルトン(CL12)、カラクリフラウ弐式(CL16)、コスモロジスト(CL20)、クリスタルビースト(CL25)、ミスリルゴーレム(CL27)",
          "コガラシ(CL27)、アダマンゴーレム(CL45)、アシュラ(CL48)、火龍ヘルブレイザー(CL50)、氷龍グレイシャル(CL65)",
          "ロックダンサー(CL39)、デスサジタリー(CL45)、コンゴウ(CL60)、カラクリヒメショーグン(CL75)、フェンリル(CL85)、ゴールデンクラウン(CL177)\nゴールデンクラウンが最後に残り【逃走】した場合ドロップ品は入手できない",
          "スケルトン(CL3/オリジン)、アルテミス(CL8/オリジン)、スターゲイザー(CL10/オリジン)、ヤシャ(CL10/オリジン)、ヘルハウンド(CL12/オリジン)、ゴーレム(CL13/オリジン)(〔HP〕+500、あらゆる致傷力+100)"
        ],
        "242" => [
          "アルテミス(CL8)3匹",
          "アルテミス(CL8)3匹(〔命中〕+4、〔HP〕+30、〔FP〕+20、あらゆる致傷力+20)",
          "アルテミス(CL8)3匹(〔命中〕+8、〔HP〕+60、〔FP〕+30、あらゆる致傷力+40)",
          "アルテミス(CL8)3匹(〔命中〕+16、〔HP〕+120、〔FP〕+40、あらゆる致傷力+80)",
          "アルテミス(CL8/オリジン)3匹(〔HP〕+500、あらゆる致傷力+100)"
        ],
        "243" => [
          "スターゲイザー(CL10)2匹",
          "コスモロジスト(CL20)2匹",
          "コスモロジスト(CL20)4匹",
          "デスサジタリー(CL45)2匹",
          "スターゲイザー(CL10/オリジン)2匹(〔HP〕+500、あらゆる致傷力+100)"
        ],
        "244" => [
          "ヤシャ(CL10)1匹、スケルトン(CL3)3匹",
          "ヤシャ(CL10)3匹(〔命中〕+4、〔HP〕+30、〔FP〕+10、あらゆる致傷力+15)",
          "アシュラ(CL48)2匹",
          "コンゴウ(CL60)2匹",
          "ヤシャ(CL10/オリジン)1匹、スケルトン(CL3/オリジン)3匹(〔HP〕+500、あらゆる致傷力+100)"
        ],
        "245" => [
          "ヘルハウンド(CL12)2匹",
          "クリスタルビースト(CL25)2匹",
          "火龍ヘルブレイザー(CL50)1匹、氷河龍グレイシャル(CL65)",
          "『単眼の巨神』アイングロース(CL100/ネームド)",
          "ヘルハウンド(CL12/オリジン)2匹(〔HP〕+500、あらゆる致傷力+100)"
        ],
        "246" => [
          "ゴーレム(CL13)1匹",
          "ミスリルゴーレム(CL27)1匹",
          "アダマンゴーレム(CL45)1匹",
          "カラクリヒメショーグン(CL75)1匹",
          "ゴーレム(CL13/オリジン)1匹(〔HP〕+1000、あらゆる致傷力+100)"
        ],
        "341" => [
          "アイアンプリチン(CL5)5匹",
          "アイアンプリチン(CL5)5匹(〔命中〕+4、〔HP〕+30、〔FP〕+10)",
          "アイアンプリチン(CL5)5匹(〔命中〕+8、〔HP〕+60、〔FP〕+20)",
          "アイアンプリチン(CL5)5匹(〔命中〕+16、〔HP〕+120、〔FP〕+40)",
          "アイアンプリチン(CL5/オリジン)5匹(〔HP〕+300、あらゆる致傷力+100)"
        ],
        "342" => [
          "ウイングスレイブ(CL4)5匹",
          "ウイングスレイブ(CL4)5匹(〔命中〕+4、〔HP〕+30、〔FP〕+10、あらゆる致傷力+20)",
          "ガルーダ(CL40)2匹",
          "栄光の天使(CL60)2匹",
          "ウイングスレイブ(CL4/オリジン)5匹(〔HP〕+300、あらゆる致傷力+100)"
        ],
        "343" => [
          "ブラックナイト(CL10)1匹、ソルジャー(CL4)3匹",
          "デュラハン(CL22)1匹、ブラックナイト(CL10)2匹",
          "サーバントマスター(CL35)1匹、デュラハン(CL22)2匹",
          "ジェネラル(CL55)1匹、サーバントマスター(CL35)2匹",
          "ブラックナイト(CL10/オリジン)1匹、ソルジャー(CL4/オリジン)3匹(〔HP〕+500、あらゆる致傷力+100)"
        ],
        "344" => [
          "ソルジャーアント(CL8)2匹",
          "ソルジャーアント(CL8)2匹(〔命中〕+4、〔HP〕+30、〔FP〕+10、あらゆる致傷力+20)",
          "インペリアルアント(CL30)2匹",
          "『女王キノコ』アカシックツリー(CL50/ネームド)1匹、インペリアルアント(CL30)2匹",
          "ソルジャーアント(CL8/オリジン)2匹(〔HP〕+500、あらゆる致傷力+100)"
        ],
        "345" => [
          "カボチャの魔女(CL8)2匹",
          "カボチャの魔女(CL8)2匹(〔命中〕+4、〔HP〕+30、〔FP〕+10、あらゆる致傷力+20)",
          "カボチャの大魔女(CL35)2匹",
          "堕落の黒天使(CL60)2匹",
          "カボチャの魔女(CL8/オリジン)2匹(〔HP〕+500、あらゆる致傷力+100)"
        ],
        "346" => [
          "フェニックス(CL25)2匹",
          "フェニックス(CL25)2匹(〔命中〕+4、〔HP〕+40、〔FP〕+10、あらゆる致傷力+30)",
          "フェニックス(CL25)2匹(〔命中〕+8、〔HP〕+80、〔FP〕+20、あらゆる致傷力+60)",
          "煉獄フェニックス(CL85)2匹",
          "フェニックス(CL25/オリジン)2匹(〔HP〕+1000、あらゆる致傷力+200)"
        ],
        "441" => [
          "フロストクラブ(CL6)2匹",
          "フロストクラブ(CL6)3匹",
          "『氷海の主』ギガントキャンサー(CL20/ネームド)",
          "『氷海の主』ギガントキャンサー(CL20/ネームド)、フロストクラブ(CL6)3匹",
          "フロストクラブ(CL6/オリジン)2匹(〔HP〕+500、あらゆる致傷力+100)"
        ],
        "442" => [
          "アシガル(CL4)3匹",
          "ハタモト(CL10)3匹",
          "ヒトキリ(CL33)2匹",
          "スカーレス(CL38)3匹",
          "アシガル(CL4/オリジン)3匹(〔HP〕+500、あらゆる致傷力+100)"
        ],
        "443" => [
          "アンブッシュマン(CL5)3匹",
          "アンブッシュマン(CL5)3匹(〔命中〕+4、〔HP〕+20、〔FP〕+10、あらゆる致傷力+10)",
          "シャドウストーカー(CL35)2匹",
          "シャドウストーカー(CL35)3匹",
          "アンブッシュマン(CL5/オリジン)3匹(〔HP〕+500、あらゆる致傷力+100)"
        ],
        "444" => [
          "アップルドール(CL12)2匹",
          "アップルドール(CL12)2匹、ポイズンリリー(CL7)2匹",
          "テラードール(CL30)2匹",
          "テラードール(CL30)2匹、バリアリーフ(CL27)2匹",
          "アップルドール(CL12/オリジン)2匹(〔HP〕+500、あらゆる致傷力+100)"
        ],
        "445" => [
          "ナイトライダー(CL15)1匹",
          "ナイトライダー(CL15)2匹",
          "ジェネラル(CL55)1匹",
          "ジェネラル(CL55)2匹",
          "ナイトライダー(CL15/オリジン)1匹(〔HP〕+800、あらゆる致傷力+100)"
        ],
        "446" => [
          "ジェルスケルトン(CL10)1匹",
          "ジェルスケルトン(CL10)1匹(〔命中〕+4、〔FP〕+10、あらゆる致傷力+20)",
          "ジェルスケルトン(CL10)1匹(〔命中〕+8、〔FP〕+20、あらゆる致傷力+40)",
          "ジェルスケルトン(CL10)1匹(〔命中〕+12、〔FP〕+40、あらゆる致傷力+80)",
          "ジェルスケルトン(CL10/オリジン)1匹(〔HP〕+1500、あらゆる致傷力+200)"
        ],
        "541" => [
          "スナッチャー(CL4)3匹",
          "ゴールデンビースト(CL10)3匹",
          "ヨウコ(CL30)2匹",
          "イビルオーメン(CL42)2匹",
          "スナッチャー(CL4/オリジン)3匹(〔HP〕+500、あらゆる致傷力+100)"
        ],
        "542" => [
          "スターゲイザー(CL10)1匹、オーク(CL3)3匹",
          "スターゲイザー(CL10)1匹、ヘルハウンド(CL12)2匹",
          "コスモロジスト(CL20)1匹、ケルベロス(CL33)1匹",
          "サーバントマスター(CL35)1匹、ケルベロス(CL33)2匹",
          "スターゲイザー(CL10/オリジン)1匹、オーク(CL3/オリジン)3匹(〔HP〕+500、あらゆる致傷力+100)"
        ],
        "543" => [
          "オウルセージ(CL5)1匹、インプ(CL3)3匹。指定エネミー:オウルセージ",
          "オウルセージ(CL5)3匹。指定エネミー:オウルセージ",
          "オウルコマンダー(CL18)1匹、キメラ(CL15)2匹。指定エネミー:オウルコマンダー",
          "オウルコマンダー(CL18)2匹、キメラグレート(CL60)1匹。指定エネミー:オウルコマンダー",
          "オウルセージ(CL/オリジン5)1匹、インプ(CL3/オリジン)3匹(〔HP〕+500、あらゆる致傷力+100)。指定エネミー:オウルセージ"
        ],
        "544" => [
          "グリーンアクトレス(CL22)1匹",
          "魔将樹の騎士(CL40)1匹",
          "魔将樹の番人(CL80)1匹",
          "『魔将樹の剣姫』ロジエモール(CL120/ネームド)1匹",
          "グリーンアクトレス(CL22/オリジン)1匹(〔HP〕+200、あらゆる致傷力+200、分類「ネームド」と【始原の力】を追加)"
        ],
        "545" => [
          "ポイズンリリー(CL7)1匹、リリーの尖兵(CL5)1匹",
          "ポイズンリリー(CL7)1匹、リリーの尖兵(CL5)1匹(〔命中〕+4、〔HP〕+30、〔FP〕+10、あらゆる致傷力+20)",
          "バリアリーフ(CL27)1匹、リリーの尖兵(CL5)1匹(〔命中〕+8、〔HP〕+60、〔FP〕+20、あらゆる致傷力+40)",
          "『密林の女王』クイーンリリー(CL70/ネームド)1匹、リリーの尖兵(CL5)1匹(〔命中〕+16、〔HP〕+120、〔FP〕+40、あらゆる致傷力+80)",
          "ポイズンリリー(CL7/オリジン)1匹、リリーの尖兵(CL5/オリジン)1匹(〔HP〕+800、あらゆる致傷力+100)"
        ],
        "546" => [
          "ブラックナイト(CL10)1匹、ソルジャー(CL4)3匹",
          "ヴァルキリー(CL20)1匹、ブラックナイト(CL10)2匹",
          "フレイヤ(CL45)1匹、ヴァルキリー(CL20)2匹",
          "ジェネラル(CL55)1匹、フレイヤ(CL45)2匹",
          "ブラックナイト(CL10/オリジン)1匹、ソルジャー(CL4/オリジン)3匹(〔HP〕+500、あらゆる致傷力+100)"
        ],
        "641" => [
          "ヤコ(CL6)3匹(【狐の送り火】のデータを「疲労:なし」に変更)",
          "ヨウコ(CL30)1匹(【狐の送り火】のデータを「疲労:なし」に変更)",
          "ヨウコ(CL30)3匹(【狐の送り火】のデータを「疲労:なし」に変更)",
          "タタリドラゴン(CL60/ネームド)1匹(【狐の送り火】のデータを「疲労:なし」に変更)",
          "ヤコ(CL6/オリジン)3匹((〔HP〕+500、あらゆる致傷力+100、【狐の送り火】のデータを「疲労:なし」に変更)"
        ],
        "642" => [
          "スケルトン(CL3)4匹",
          "ナイトスケルトン(CL12)3匹",
          "ヒトキリ(CL33)2匹(「分類:アンデッド」を追加)",
          "堕ちた黒龍(CL48)2匹",
          "スケルトン(CL3/オリジン)4匹(〔HP〕+500、あらゆる致傷力+200)"
        ],
        "643" => [
          "ポイズンリリー(CL7)1匹(【華劇:リリーオブザバレー】使用済み)、ファントム(CL5)2匹",
          "ポイズンリリー(CL7)1匹(【華劇:リリーオブザバレー】使用済み)、ゴースト(CL10)3匹",
          "グリーンアクトレス(CL22)1匹(【華劇:フォレストステップ】使用済み)、デュラハン(CL22)2匹",
          "グリーンアクトレス(CL22)1匹(【華劇:フォレストステップ】使用済み)、カラクリヒメショーグン(CL75)1匹",
          "ポイズンリリー(CL7/オリジン)1匹(【華劇:リリーオブザバレー】使用済み)、ファントム(CL5)2匹(〔HP〕+500、あらゆる致傷力+100)"
        ],
        "644" => [
          "君たちの冒険はここで終了だ。",
          "君たちの冒険はここで終了だ。",
          "君たちの冒険はここで終了だ。",
          "第二魔将『葬送者』グレイヴディガー(CL200/魔将)1匹、『ディガー様親衛隊長』フュネライユ(CL66/ネームド)1匹、『トラップマスター』アンテルモン(CL65/ネームド)1匹",
          "[現在エネミー未実装の為振り直ししてください]",
        ],
        "645" => [
          "ゴースト(CL10)1匹(通常ドロップ「1000GP」)、ソルジャー(CL4)2匹",
          "ゴースト(CL10)1匹(通常ドロップ「2000GP」)、ハタモト(CL10)3匹",
          "リッチ(CL44)1匹(通常ドロップ「4000GP」)、ミスリルゴーレム(CL27)1匹",
          "エルダーリッチ(CL55)1匹(通常ドロップ「8000GP」)、アダマンゴーレム(CL45)1匹",
          "ゴースト(CL10/オリジン)1匹(通常ドロップ「1000GP」)、ソルジャー(CL4/オリジン)2匹(〔HP〕+500、あらゆる致傷力+100)"
        ],
        "646" => [
          "ボーンスネーク(CL20)1匹",
          "ボーンスネーク(CL20)2匹",
          "ラダマンティスの蛇(CL50)1匹",
          "ラダマンティスの蛇(CL50)1匹(ネームド仕様[HP4倍、【ネームドエネミー】習得])",
          "ボーンスネーク(CL20/オリジン)1匹(〔HP〕+1500、あらゆる致傷力+200)"
        ],
        "256" => [
          "ボーンスネーク(CL50)1匹",
          "ラダマンティスの蛇(CL50)1匹",
          "銀河龍ラクテア/ドラゴン形態(CL90)1匹",
          "『三つ首の災厄』トライディザスター(CL100/ネームド)1匹",
          "ボーンスネーク(CL50/オリジン)1匹(〔HP〕+2000、あらゆる致傷力+200)"
        ],
        "265" => [
          "キャンディークラウン(CL40)「1D6」匹",
          "キャンディークラウン(CL40)「1D6+1」匹",
          "キャンディークラウン(CL40)「1D6」匹、ゴールデンクラウン(CL177)1匹",
          "キャンディークラウン(CL40)「1D6」匹、ゴールデンクラウン(CL177)2匹",
          "キャンディークラウン(CL40/オリジン)「1D6」匹",
        ],
        "465" => [
          "リビングデッド(CL5)3匹",
          "ゴースト(CL10)3匹",
          "デュラハン(CL22)3匹",
          "リッチ(CL44)3匹",
          "リビングデッド(CL5/オリジン)3匹(〔HP〕+500、あらゆる致傷力+100)"
        ],
        "665" => [
          "カロン(CL12)2匹",
          "カロンキャプテン(CL25)2匹",
          "リッチ(CL44)2匹",
          "エルダーリッチ(CL55)2匹(〔HP〕+10)",
          "カロンキャプテン(CL25/オリジン)2匹"
        ],
        "666" => [
          "『漆黒の戦鬼』ブラックナイト(CL10/ネームド)1匹",
          "『漆黒の戦鬼』ブラックナイト(CL10/ネームド)1匹(〔命中〕+4、あらゆる致傷力+20、〔HP〕+200)",
          "『白銀の猛将』ジェネラル(CL55/ネームド)1匹",
          "『白銀の猛将』ジェネラル(CL55/ネームド)1匹(〔命中〕+4、あらゆる致傷力+20、〔HP〕+500)",
          "[現在エネミー未実装の為振り直ししてください]"
        ],
      }.freeze
    end
  end
end
