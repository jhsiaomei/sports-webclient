class Organization
  attr_accessor :id, :school, :name, :color, :logo, :motto

  def initialize(input_options)
    @id = input_options["id"]
    @school = input_options["school"]
    @name = input_options["name"]
    @color = input_options["color"]
    @logo = input_options["logo"]
    @motto = input_options["motto"]
  end

  def self.find_by(input_options)
    id = input_options[:id]
    organization_api_hash = Unirest.get("#{ENV['API_BASE_URL']}/organizations/#{id}.json").body
    Organization.new(organization_api_hash)
  end

  def self.all
    organization_api_hashes = Unirest.get("#{ENV['API_BASE_URL']}/organizations.json").body
    organizations = []
    organization_api_hashes.each do 
      |organization_api_hash|
      organizations << Organization.new(organization_api_hash)
    end
    organizations
  end

  def destroy
    Unirest.delete(
      "#{ENV['API_BASE_URL']}/organizations/#{id}.json"
    )
  end

  def self.create(input_options)
    Unirest.post(
      "#{ENV['API_BASE_URL']}/organizations",
      headers:{ "Accept" => "application/json" },
      parameters: input_options
    ).body
    Organization.new(organization_api_hash)
  end

  def update(input_options)
    Unirest.patch(
      "#{ENV['API_BASE_URL']}/organizations/#{id}.json",
      headers:{ "Accept" => "application/json" },
      parameters: input_options
    ).body
  end
end