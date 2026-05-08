(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    player box
    cell
  )
  
  (:predicates
    (at ?actor - (either player box) ?c - cell)
    (clear ?c - cell)
    (adjacent ?from - cell ?to - cell)
    (is_goal ?c - cell)
  )
  
  (:action move
    :parameters (?p - player ?from - cell ?to - cell)
    :precondition (and (at ?p ?from) (clear ?to) (adjacent ?from ?to))
    :effect (and (not (at ?p ?from)) (at ?p ?to) 
                 (clear ?from) (not (clear ?to)))
  )
  
  (:action push
    :parameters (?p - player ?pf - cell ?bf - cell ?bt - cell)
    :precondition (and (at ?p ?pf) (at box ?bf) 
                       (clear ?bt) 
                       (adjacent ?pf ?bf) (adjacent ?bf ?bt))
    :effect (and (not (at ?p ?pf)) (at ?p ?bf) 
                 (not (at box ?bf)) (at box ?bt)
                 (clear ?bf) (not (clear ?bt)))
  )
)