(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types location agent item)
  (:predicates 
    (at ?agent - agent ?loc - location)
    (box_at ?item - item ?loc - location)
    (goal_at ?loc - location)
    (clear ?loc - location)
    (adjacent ?loc1 - location ?loc2 - location)
  )
  
  (:action move_agent
    :parameters (?from - location ?to - location)
    :precondition (and (at player ?from) (clear ?to) (adjacent ?from ?to))
    :effect (and (not (at player ?from)) (at player ?to))
  )

  (:action push_box
    :parameters (?agent_from - location ?agent_to - location ?box_from - location ?box_to - location)
    :precondition (and 
      (at player ?agent_from) 
      (box_at box ?box_from) 
      (clear ?box_to) 
      (adjacent ?agent_from ?box_from)
      (adjacent ?box_from ?box_to))
    :effect (and 
      (not (at player ?agent_from)) 
      (at player ?agent_to)
      (not (box_at box ?box_from)) 
      (box_at box ?box_to))
  )
)