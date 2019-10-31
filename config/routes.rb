# frozen_string_literal: true

Rails.application.routes.draw do
  resources :students, only: %i[show]
  resources :courses, only: %i[show]
end
