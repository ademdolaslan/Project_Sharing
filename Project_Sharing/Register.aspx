<%@ Page Title="Kayıt Ol" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Project_Sharing.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    
    <div class="center">
        <h1 style="color:black;"><%: Title %></h1>
    </div>
    

    <div class="form-horizontal">
        
        <hr />
        
      <div class="col-md-6">
          <div class="form-group">
            <h4 class="center" style="color: #000000">Kullanıcı Kayıt Formu</h4> <br />
            <asp:Label runat="server" CssClass="col-md-2 control-label" ForeColor="Black">Ad</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tbUserFirstName" CssClass="form-control" required/>
            </div>
        </div>
        
        <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label" ForeColor="Black">Soyad</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tbUserLastName" CssClass="form-control" required/>
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label" ForeColor="Black">Kullanıcı Adı</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tbUserName" CssClass="form-control" required />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label" ForeColor="Black">Şifre</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tbUserPassWord" CssClass="form-control" TextMode="Password" required />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label" ForeColor="Black">Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tbUserEmail" CssClass="form-control" TextMode="Email" required/>
            </div>
        </div>
        
        <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label" ForeColor="Black">Kullanıcı Türü</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList ID="DDLUserType" runat="server" CssClass="form-control" Width="280px"> 
                    <asp:listitem Value="0">Seçiniz...</asp:listitem>
                    <asp:listitem Value="2">Akademisyen</asp:listitem>
                    <asp:listitem Value="3">Öğrenci</asp:listitem>
                    <asp:listitem Value="4">Diğer</asp:listitem>
                </asp:DropDownList>                
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label" ForeColor="Black">Adres</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tbUserAddress" CssClass="form-control" required/>
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label" ForeColor="Black">Telefon</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tbUserTel" CssClass="form-control" TextMode="Phone" MaxLength="11" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);" required />

            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label" ForeColor="Black">Yaş</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tbUserAge" CssClass="form-control" TextMode="Number" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);" required Width="280px"/>
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label" ForeColor="Black">İş(Meslek)</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tbUserJob" CssClass="form-control" required/>
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label" ForeColor="Black">Okul</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tbUserSchool" CssClass="form-control" required/>
            </div>
        </div>


        <div class="form-group">            
            <div class="col-md-1">                
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                      <asp:CheckBox ID="cbAccept" runat="server" CssClass="cb"  ClientIDMode="Static" EnableViewState="true" AutoPostBack="True" required ForeColor="White" OnCheckedChanged="cbAccept_CheckedChanged"/>

                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="cbAccept" EventName="CheckedChanged" />
                    </Triggers>
                </asp:UpdatePanel>
                             
            </div>

            <asp:Label runat="server" CssClass="checkbox-label" ForeColor="Black">Kullanıcı Sözleşmesini Onaylıyorum.</asp:Label>
        </div>


        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button id="btnsub" runat="server" OnClick="CreateUser_Click" Text="Kayıt Ol" CssClass="btn btn-default" ClientIDMode="Static" />
            </div>
        </div>
      </div>  
        
     <div class="col-md-6">
         <asp:Label ID="Label1" runat="server" Text="
             &lt;h3 class=&quot;center&quot;&gt;SİTE KULLANIM ŞARTLARI&lt;/h3&gt;
Lütfen sitemizi kullanmadan evvel bu ‘site kullanım şartları’nı dikkatlice okuyunuz. &lt;br /&gt;
İşbu sözleşme taraflara sözleşme konusu site ile ilgili hak ve yükümlülükler yükler ve taraflar işbu sözleşmeyi kabul ettiklerinde bahsi geçen hak ve yükümlülükleri eksiksiz, doğru, zamanında, işbu sözleşmede talep edilen şartlar dâhilinde yerine getireceklerini beyan ederler.&lt;br /&gt;
             &lt;br /&gt;
1. SORUMLULUKLAR&lt;br /&gt;
a.Firma, fiyatlar ve sunulan ürün ve hizmetler üzerinde değişiklik yapma hakkını her zaman saklı tutar.&lt;br /&gt; 
b.Firma, üyenin sözleşme konusu hizmetlerden, teknik arızalar dışında yararlandırılacağını kabul ve taahhüt eder.&lt;br /&gt;
c.Kullanıcı, sitenin kullanımında tersine mühendislik yapmayacağını ya da bunların kaynak kodunu bulmak veya elde etmek amacına yönelik herhangi bir başka işlemde bulunmayacağını aksi halde ve 3. Kişiler nezdinde doğacak zararlardan sorumlu olacağını, hakkında hukuki ve cezai işlem yapılacağını peşinen kabul eder. &lt;br /&gt;
d.Kullanıcı, site içindeki faaliyetlerinde, sitenin herhangi bir bölümünde veya iletişimlerinde genel ahlaka ve adaba aykırı, kanuna aykırı, 3. Kişilerin haklarını zedeleyen, yanıltıcı, saldırgan, müstehcen, pornografik, kişilik haklarını zedeleyen, telif haklarına aykırı, yasa dışı faaliyetleri teşvik eden içerikler üretmeyeceğini, paylaşmayacağını kabul eder. Aksi halde oluşacak zarardan tamamen kendisi sorumludur ve bu durumda ‘Site’ yetkilileri, bu tür hesapları askıya alabilir, sona erdirebilir, yasal süreç başlatma hakkını saklı tutar. Bu sebeple yargı mercilerinden etkinlik veya kullanıcı hesapları ile ilgili bilgi talepleri gelirse paylaşma hakkını saklı tutar.&lt;br /&gt;
e.Sitenin üyelerinin birbirleri veya üçüncü şahıslarla olan ilişkileri kendi sorumluluğundadır. &lt;br /&gt;
             &lt;br /&gt;
2.  Fikri Mülkiyet Hakları&lt;br /&gt;
             &lt;br /&gt;
2.1. İşbu Site’de yer alan ünvan, işletme adı, marka, patent, logo, tasarım, bilgi ve yöntem gibi tescilli veya tescilsiz tüm fikri mülkiyet hakları site işleteni ve sahibi firmaya veya belirtilen ilgilisine ait olup, ulusal ve uluslararası hukukun koruması altındadır. İşbu Site’nin ziyaret edilmesi veya bu Site’deki hizmetlerden yararlanılması söz konusu fikri mülkiyet hakları konusunda hiçbir hak vermez.&lt;br /&gt;
2.2. Site’de yer alan bilgiler hiçbir şekilde çoğaltılamaz, yayınlanamaz, kopyalanamaz, sunulamaz ve/veya aktarılamaz. Site’nin bütünü veya bir kısmı diğer bir internet sitesinde izinsiz olarak kullanılamaz. &lt;br /&gt;
             &lt;br /&gt;
3. Gizli Bilgi&lt;br /&gt;
3.1. Firma, site üzerinden kullanıcıların ilettiği kişisel bilgileri 3. Kişilere açıklamayacaktır. Bu kişisel bilgiler; kişi adı-soyadı, adresi, telefon numarası, cep telefonu, e-posta adresi gibi Kullanıcı’yı tanımlamaya yönelik her türlü diğer bilgiyi içermekte olup, kısaca ‘Gizli Bilgiler’ olarak anılacaktır.&lt;br /&gt;
             &lt;br /&gt;
3.2. Kullanıcı, sadece tanıtım, reklam, kampanya, promosyon, duyuru vb. pazarlama faaliyetleri kapsamında kullanılması ile sınırlı olmak üzere, Site’nin sahibi olan firmanın kendisine ait iletişim, portföy durumu ve demografik bilgilerini iştirakleri ya da bağlı bulunduğu grup şirketleri ile paylaşmasına muvafakat ettiğini kabul ve beyan eder. Bu kişisel bilgiler firma bünyesinde müşteri profili belirlemek, müşteri profiline uygun promosyon ve kampanyalar sunmak ve istatistiksel çalışmalar yapmak amacıyla kullanılabilecektir.&lt;br /&gt;
             &lt;br /&gt;
3.3. Gizli Bilgiler, ancak resmi makamlarca usulü dairesinde bu bilgilerin talep edilmesi halinde ve yürürlükteki emredici mevzuat hükümleri gereğince resmi makamlara açıklama yapılmasının zorunlu olduğu durumlarda resmi makamlara açıklanabilecektir.&lt;br /&gt;
             &lt;br /&gt;
4. Garanti Vermeme: İŞBU SÖZLEŞME MADDESİ UYGULANABİLİR KANUNUN İZİN VERDİĞİ AZAMİ ÖLÇÜDE GEÇERLİ OLACAKTIR. FİRMA TARAFINDAN SUNULAN HİZMETLER &quot;OLDUĞU GİBİ” VE &quot;MÜMKÜN OLDUĞU” TEMELDE SUNULMAKTA VE PAZARLANABİLİRLİK, BELİRLİ BİR AMACA UYGUNLUK VEYA İHLAL ETMEME KONUSUNDA TÜM ZIMNİ GARANTİLER DE DÂHİL OLMAK ÜZERE HİZMETLER VEYA UYGULAMA İLE İLGİLİ OLARAK (BUNLARDA YER ALAN TÜM BİLGİLER DÂHİL) SARİH VEYA ZIMNİ, KANUNİ VEYA BAŞKA BİR NİTELİKTE HİÇBİR GARANTİDE BULUNMAMAKTADIR. &lt;br /&gt;
             &lt;br /&gt;
5. Kayıt ve Güvenlik &lt;br /&gt;
Kullanıcı, doğru, eksiksiz ve güncel kayıt bilgilerini vermek zorundadır. Aksi halde bu Sözleşme ihlal edilmiş sayılacak ve Kullanıcı bilgilendirilmeksizin hesap kapatılabilecektir.&lt;br /&gt;
Kullanıcı, site ve üçüncü taraf sitelerdeki şifre ve hesap güvenliğinden kendisi sorumludur. Aksi halde oluşacak veri kayıplarından ve güvenlik ihlallerinden veya donanım ve cihazların zarar görmesinden Firma sorumlu tutulamaz.&lt;br /&gt;
             &lt;br /&gt;
6. Mücbir Sebep&lt;br /&gt;
             &lt;br /&gt;
Tarafların kontrolünde olmayan; tabii afetler, yangın, patlamalar, iç savaşlar, savaşlar, ayaklanmalar, halk hareketleri, seferberlik ilanı, grev, lokavt ve salgın hastalıklar, altyapı ve internet arızaları, elektrik kesintisi gibi sebeplerden (aşağıda birlikte &quot;Mücbir Sebep” olarak anılacaktır.) dolayı sözleşmeden doğan yükümlülükler taraflarca ifa edilemez hale gelirse, taraflar bundan sorumlu değildir. Bu sürede Taraflar’ın işbu Sözleşme’den doğan hak ve yükümlülükleri askıya alınır. &lt;br /&gt;
             &lt;br /&gt;
7. Sözleşmenin Bütünlüğü ve Uygulanabilirlik&lt;br /&gt;
             &lt;br /&gt;
İşbu sözleşme şartlarından biri, kısmen veya tamamen geçersiz hale gelirse, sözleşmenin geri kalanı geçerliliğini korumaya devam eder.&lt;br /&gt;
             &lt;br /&gt;
8. Sözleşmede Yapılacak Değişiklikler&lt;br /&gt;
             &lt;br /&gt;
Firma, dilediği zaman sitede sunulan hizmetleri ve işbu sözleşme şartlarını kısmen veya tamamen değiştirebilir. Değişiklikler sitede yayınlandığı tarihten itibaren geçerli olacaktır. Değişiklikleri takip etmek Kullanıcı’nın sorumluluğundadır. Kullanıcı, sunulan hizmetlerden yararlanmaya devam etmekle bu değişiklikleri de kabul etmiş sayılır.&lt;br /&gt;
             &lt;br /&gt;
9. Tebligat&lt;br /&gt;
İşbu Sözleşme ile ilgili taraflara gönderilecek olan tüm bildirimler, Firma’nın bilinen e.posta adresi ve kullanıcının üyelik formunda belirttiği e.posta adresi vasıtasıyla yapılacaktır. Kullanıcı, üye olurken belirttiği adresin geçerli tebligat adresi olduğunu, değişmesi durumunda 5 gün içinde yazılı olarak diğer tarafa bildireceğini, aksi halde bu adrese yapılacak tebligatların geçerli sayılacağını kabul eder.&lt;br /&gt;
             &lt;br /&gt;
10. Delil Sözleşmesi&lt;br /&gt;
Taraflar arasında işbu sözleşme ile ilgili işlemler için çıkabilecek her türlü uyuşmazlıklarda Taraflar’ın defter, kayıt ve belgeleri ile ve bilgisayar kayıtları ve faks kayıtları 6100 sayılı Hukuk Muhakemeleri Kanunu uyarınca delil olarak kabul edilecek olup, kullanıcı bu kayıtlara itiraz etmeyeceğini kabul eder.&lt;br /&gt;
             &lt;br /&gt;
11. Uyuşmazlıkların Çözümü&lt;br /&gt;
İşbu Sözleşme’nin uygulanmasından veya yorumlanmasından doğacak her türlü uyuşmazlığın çözümünde İstanbul (Merkez) Adliyesi Mahkemeleri ve İcra Daireleri yetkilidir.&lt;br /&gt;




         " ForeColor="Black"></asp:Label>
     </div>

    </div>





</asp:Content>
