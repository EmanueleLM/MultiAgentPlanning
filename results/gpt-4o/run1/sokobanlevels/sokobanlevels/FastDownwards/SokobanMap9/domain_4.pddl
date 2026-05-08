(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types location agent item)
  (:predicates 
    (at ?a - agent ?l - location)
    (box_at ?i - item ?l - location)
    (goal_at ?l - location)
    (clear ?l - location)
    (adjacent ?l1 - location ?l2 - location)
  )
  
  (:action move_agent
    :parameters (?a - agent ?from - location ?to - location)
    :precondition (and (at ?a ?from) (clear ?to) (adjacent ?from ?to))
    :effect (and (not (at ?a ?from)) (at ?a ?to))
  )

  (:action push_box
    :parameters (?a - agent ?agent_from - location ?agent_to - location ?box_from - location ?box_to - location)
    :precondition (and 
      (at ?a ?agent_from) 
      (box_at box ?box_from) 
      (clear ?box_to) 
      (adjacent ?agent_from ?box_from)
      (adjacent ?box_from ?box_to))
    :effect (and 
      (not (at ?a ?agent_from)) 
      (at ?a ?agent_to)
      (not (box_at box ?box_from)) 
      (box_at box ?box_to))
  )
)