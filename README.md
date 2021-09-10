# OrderCoffee
## _Use Objective-C to practice constructing MVVM architecture_
#### 目錄
- 程式的功能與編寫動機
- 各檔案的功用
- 使用到的技術與用意


### 程式的功能與編寫動機
程式功能 - 主要是點咖啡功能，首頁呈現已點咖啡的頁面，點咖啡頁面則是可以選擇咖啡容量、咖啡種類、可輸入姓名與信箱，
比較簡易的功能，重點想先擺在建構MVVM的練習上。

練習的動機 - 主要是因為面試時有看到目前業界會要求MVVM架構，因此有線上學習了如何用Swift建構出MVVM，
而Objective-C想說是不是也能用此架構，就想嘗試看看，不過似乎語言特性的不同，不像Swift比較直覺的勾畫出架構。
至於Objective-C的ViewModel、Service與Models間如何去溝通，稍後會介紹。


作品圖


<img src=https://github.com/Mike80310/OrderCoffee/blob/2fb08f66d12f98f5eedeedc7611e3dc61c91569b/%E8%9E%A2%E5%B9%95%E9%8C%84%E8%A3%BD%202021-09-09%2011.gif alt="makeselfGIF" width ="50%"/>



檔案數量之差異


<img src="https://github.com/Mike80310/OrderCoffee/blob/36ae0a254f335a7dc9762b62d6b220820bbacb8c/%E6%88%AA%E5%9C%96%202021-09-09%2011.09.44.png" alt="xcodeFile" width="50%"/>


### 各檔案的功用
- Service - 主要是用來呼叫RESTFUL，而其中Order相關的json解析與存取也分類在這。
- Models - 定義一份餐點時所需內容的架構與咖啡模型，在Swift中的struct，Objective-C特性的不同，我選擇用NSObject做取代。
- ViewModels - Controller可直接呼叫相關Function呈現資料至View上。 Swift中的extension struct的一些屬性，我拆分出來寫成OrderDisplay的物件作替代，對於我自己比較好理解。
- Controllers - 使用ViewModels呈現資料或者從View取資料傳至ViewModels。
- Views - 單純建構視覺圖。

### 使用到的技術與用意
Swift在學習過程中發現語言特性的強大，傳值似乎較為容易一些，許多事情語言本身會幫你處理掉，不過每一行的使用就也變得要更為清楚及小心，以及意義是什麼，架構才會漂亮。
而在Objective-C中此練習我用Block與Protocol去綁定讓程式的呼叫及傳值達到目的。

在Objective-C沒有 `Result<Success, Failure>` 因此也是需要用到Block去替代。
```
- (void)getURL:(NSURL *)url JsonData:(NSData *)data HttpMethod:(NSString *)httpMethod 
WithSuccess:(void (^)(NSData *))successCompletion 
Error:(void (^)(NSError *))errorCompletion; 
```
當中沒有用很複雜的技術，純粹是把程式架構拆分成適當的大小，當作練習建構MVVM的過程，看是否能把職責拆分開來比較好維護與新增功能。
除了使用較多的Block與Protocol也有用typedef enum去定義Webservice是要執行哪個RESTFUL API，OrderFetcher初始化時得給予enum定義的值，
還有prepareForSegue去設置Delegate的簡單應用。

## 說明Order相關檔案：
耦合性不低，例如想新增吃的餐點或者其他不相關功能得新增的檔案有Fetcher、相關Model、相關Parser與ViewModel，而ViewModel本來就要建置。因為使用Protocol達到傳值Order物件的目的，因此Order檔案間是相關連的，不過每個檔案的任務至少都是獨立作業的，除錯維護會較容易，至於要寫成不同的模組物件都可傳遞，應該是要朝多型模組撰寫，WebService API模組化，可另開side project執行。

