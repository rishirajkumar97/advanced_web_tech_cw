# app/controllers/graphs_controller.rb
class GraphsController < ApplicationController
    before_action :set_graph, only: [:show, :update, :destroy]
  
    # GET /graphs
    def index
      @graphs = Graph.all
      render json: @graphs
    end
  
    # GET /graphs/:id
    def show
      render json: @graph
    end
  
    # POST /graphs
    def create
      @graph = Graph.new(graph_params)
      if @graph.save
        render json: @graph, status: :created, location: @graph
      else
        render json: @graph.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /graphs/:id
    def update
      if @graph.update(graph_params)
        render json: @graph
      else
        render json: @graph.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /graphs/:id
    def destroy
      @graph.destroy
    end
  
    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_graph
      @graph = Graph.find(params[:id])
    end
  
    # Only allow a list of trusted parameters through.
    def graph_params
      params.require(:graph).permit(:title, :data, :description) # Customize these attributes to your model
    end
  end
  