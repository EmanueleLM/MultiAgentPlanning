(define (domain sokoban)
  (:requirements :strips)

  (:predicates
    (at_player ?x ?y)
    (at_box ?bx ?by)
    (goal ?gx ?gy)
    (clear ?cx ?cy)
    (adjacent ?x1 ?y1 ?x2 ?y2)
  )

  (:action move
    :parameters (?fx ?fy ?tx ?ty)
    :precondition (and (at_player ?fx ?fy) (clear ?tx ?ty) (adjacent ?fx ?fy ?tx ?ty))
    :effect (and (not (at_player ?fx ?fy)) (at_player ?tx ?ty))
  )

  (:action push
    :parameters (?fx ?fy ?bx ?by ?tx ?ty)
    :precondition (and 
      (at_player ?fx ?fy)
      (at_box ?bx ?by)
      (clear ?tx ?ty)
      (adjacent ?fx ?fy ?bx ?by)
      (adjacent ?bx ?by ?tx ?ty))
    :effect (and 
      (not (at_player ?fx ?fy)) (at_player ?bx ?by)
      (not (at_box ?bx ?by)) (at_box ?tx ?ty)
      (clear ?bx ?by) (not (clear ?tx ?ty)))
  )
)