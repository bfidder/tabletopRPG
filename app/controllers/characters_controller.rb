class CharactersController < ApplicationController
  # GET /characters
  # GET /characters.json
  def index
    @characters = Character.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @characters }
    end
  end

  # GET /characters/1
  # GET /characters/1.json
  def show
    @character = Character.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @character }
    end
  end

  # GET /characters/new
  # GET /characters/new.json
  def new
    @character = Character.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @character }
    end
  end

  # GET /characters/1/edit
  def edit
    @character = Character.find(params[:id])
  end

  # POST /characters
  # POST /characters.json
  def create
    @character = Character.new(params[:character])

		#logic to get the attribute values from the form and store the attributes in an array
		#I know this is horrid coding style and will only last for this iteration until I format
		#things a bit better.
		attributes = Array.new
		strength = Attribute.new(name: "Strength", value: params[:strength_value])
		attributes.push strength
		agility = Attribute.new(name: "Agility", value: params[:agility_value])
		attributes.push agility
		intelligence = Attribute.new(name: "Intelligence", value: params[:intelligence_value])
		attributes.push intelligence
		willpower = Attribute.new(name: "Willpower", value: params[:willpower_value])
		attributes.push willpower
		awareness = Attribute.new(name: "Awareness", value: params[:awareness_value])
		attributes.push awareness
		vitality = Attribute.new(name: "Vitality", value: params[:vitality_value])
		attributes.push vitality
		
		skills = Array.new
		athletics = Skill.new(name: "athletics", value: params[:athletics_value])
		skills.push athletics
		artistry = Skill.new(name: "artistry", value: params[:artistry_value])
		skills.push artistry
		animal_handling = Skill.new(name: "animal_handling", value: params[:animal_handling_value])
		skills.push animal_handling
		covert = Skill.new(name: "covert", value: params[:covert_value])
		skills.push covert
		craft = Skill.new(name: "craft", value: params[:craft_value])
		skills.push craft
		disipline = Skill.new(name: "disipline", value: params[:disipline_value])
		skills.push disipline
		guns = Skill.new(name: "guns", value: params[:guns_value])
		skills.push guns
		heavy_weapons = Skill.new(name: "heavy_weapons", value: params[:heavy_weapons_value])
		skills.push heavy_weapons
		influence = Skill.new(name: "influence", value: params[:influence_value])
		skills.push influence
		knowledge = Skill.new(name: "knowledge", value: params[:knowledge_value])
		skills.push knowledge
		mech_eng = Skill.new(name: "mech_eng", value: params[:mech_eng_value])
		skills.push mech_eng
		linguist = Skill.new(name: "linguist", value: params[:linguist_value])
		skills.push linguist
		medical_expr = Skill.new(name: "medical_expr", value: params[:medical_expr_value])
		skills.push medical_expr
		melee = Skill.new(name: "melee", value: params[:melee_value])
		skills.push melee
		perception = Skill.new(name: "perception", value: params[:perception_value])
		skills.push perception
		performance = Skill.new(name: "performance", value: params[:performance_value])
		skills.push performance
		pilot = Skill.new(name: "pilot", value: params[:pilot_value])
		skills.push pilot
		planetary_vech = Skill.new(name: "planetary_vechicles", value: params[:planetary_vech_value])
		skills.push planetary_vech
		ranged_weapons = Skill.new(name: "ranged_weapons", value: params[:ranged_weapons_value])
		skills.push ranged_weapons
		scientific_expr = Skill.new(name: "scientific Experience", value: params[:scientific_expr_value])
		skills.push scientific_expr
		survival = Skill.new(name: "survival", value: params[:survival_value])
		skills.push survival
		tech_expr = Skill.new(name: "tech experience", value: params[:tech_expr_value])
		skills.push tech_expr
	  unarmed_combat = Skill.new(name: "unarmed combat", value: params[:unarmed_combat_value])
		skills.push unarmed_combat

		equipments = Array.new
		money = Equipment.new(name: "money", value: params[:money_value])
		equipments.push money
		gun1 = Equipment.new(name: "gun1", value: params[:gun_value1], type: params[:gun_type1])
		equipments.push gun1
		gun2 = Equipment.new(name: "gun2", value: params[:gun_value2], type: params[:gun_type2])
		equipments.push gun2
		armor = Equipment.new(name: "armor", value: params[:armor_value], type: params[:armor_type])
		equipments.push armor


    respond_to do |format|
      if @character.save
			#if the character is saved, set the character ids for the attributes to the character id
				attributes.each do |a|
					a.character_id = @character.id
					a.save
				end
				skills.each do |s|
					s.character_id = @character.id
					s.save
				end
				equipments.each do |e|
					e.character_id = @character.id
					e.save
				end
        format.html { redirect_to @character, notice: "Character #{@character.name} was successfully created." }
        format.json { render json: @character, status: :created, location: @character }
      else
        format.html { render action: "new" }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /characters/1
  # PUT /characters/1.json
  def update
    @character = Character.find(params[:id])

    respond_to do |format|
      if @character.update_attributes(params[:character])
        format.html { redirect_to @character, notice: 'Character was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /characters/1
  # DELETE /characters/1.json
  def destroy
    @character = Character.find(params[:id])
    @character.destroy

    respond_to do |format|
      format.html { redirect_to characters_url }
      format.json { head :no_content }
    end
  end
end
