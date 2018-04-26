class MortCalcHomePage
  include PageObject
  page_url 'https://www.mortgagecalculator.org/'

  text_field(:homevalue , :id=>"homeval")
  text_field(:downpayment, :id =>"downpayment")
  text_field(:interestrate, :id=>"intrstsrate")
  div(:repay_block, :class=>'repayment-block')

  divs(:trialdiv,:xpath=>'//*[@class="repayment-block"/div]')

  divs(:divpayment1,:xpath=>'//*[@id="calc"]/form/section/section[2]/div/div/div[1]/div/div/div[3]/div[2]/div[2]/div[1]')
  h3(:divpayment,:xpath =>'//*[@id="calc"]/form/section/section[2]/div/div/div[1]/div/div/div[3]/div[2]/div[2]/div[1]/div[1]/h3')
  a(:asavemaney, :xpath=>'/html/body/section/section/div/div/nav/ul/li[6]/a')
  a(:aextrapayment, :xpath=>'//*[@class="main-menu"]/nav/ul/li[6]/ul/li[1]/a')

  li(:ulsubmenu, :xpath=>'//*[@class="main-menu"]/nav/ul/li[6]')


  button(:calculate, :name=>"cal")

  def populatedata (homevalue,downpayment,interestrate)
    self.homevalue = homevalue
    self.downpayment = downpayment
    self.interestrate = interestrate
    calculate_element.click
  end

  def get_data_from_YML

    yml_file = "test_data.yml"


    fileName = File.expand_path('../../../data/test_data.yml',__FILE__)

    p fileName


    @aFile = YAML.load_file fileName
#    p      @aFile.fetch @aFile['test1']['HomeVal']
    @aFile.fetch('request')

    homeval =  @aFile['test1']['HomeVal']
    downpay =  @aFile['test1']['Downpay']
    interest =  @aFile['test1']['Interest']
    p homeval, downpay, interest

    populatedata(homeval,downpay,interest)
=begin
    p @aFile.fetch('request')
    p @aFile['content']['session']

    p @aFile['city_name']
=end

    #file.open(fileName,"r+")

     #dataFile = File.open()
  end

  def read_display
    p 'here'
#    p self.trialdiv_elements[0].div.h3.text
    p self.repay_block_element.div.div.h3.text
    p self.divpayment1_elements.length
    p self.divpayment1_elements[0].div.h3.text
   # p self.divpayment1_element.div.h3.text
    p self.divpayment_element.text
  end

end