# frozen_string_literal: true

# classes allow blueprints
# array-store in sequence
# hash--store pairs
# custom--car, invoice, customer, users--
# OOP: use code to model real world items

# object: group functionalities into a single unit, an object is a customer container for data, made from a class, it is a single instance of a class

# instance variables--atributes, properties--variable that belong to the object

# attributes: details, characteristics, book--ripped up, 3 years old

# all books have different attributes, but all books have the same types of characteristics--authors, pages, publishing dates, etc.

# instance methods--interact with an object--things like push with array, next with integer, etc.--they provide functionality with objects

# encapsulation--restricts direct access to an object

# methods allow interaction in specific ways only, in the way that we define only

# class is a blueprint, patter, template, outline for an object

# object: an instance of a class, created from a class

# Instantiation: process of creating an object from a class

# class: abstract type: hides the complexity of interacting with data, methods abstract the complexity of a process

p 5.class
p 3.41.class.superclass

class Gadget
end

phone = Gadget.new
laptop = Gadget.new

module LengthConversions
  def self.miles_to_feet(miles)
    miles * 5280
  end

  def self.miles_to_inches(miles)
    miles_to_feet(miles) * 12
  end

  def self.miles_to_centimeters(miles)
    miles_to_inches(miles) * 2.54
  end
end

puts LengthConversions.miles_to_centimeters(2)
