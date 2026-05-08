(define (domain sokoban_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types player box position)
  (:predicates
    (at ?p - player ?x - position)
    (box-at ?b - box ?x - position)
    (goal ?x - position)
    (adj ?x - position ?y - position)
    (free ?x - position)
  )

  (:action move_up
    :parameters (?pl - player ?from - position ?to - position)
    :precondition (and (at ?pl ?from) (adj ?to ?from) (free ?to))
    :effect (and
      (not (at ?pl ?from))
      (at ?pl ?to)
      (free ?from)
      (not (free ?to))
    )
  )

  (:action move_down
    :parameters (?pl - player ?from - position ?to - position)
    :precondition (and (at ?pl ?from) (adj ?from ?to) (free ?to))
    :effect (and
      (not (at ?pl ?from))
      (at ?pl ?to)
      (free ?from)
      (not (free ?to))
    )
  )

  (:action push_down
    :parameters (?pl - player ?b - box ?from - position ?boxpos - position ?tgt - position)
    :precondition (and
      (at ?pl ?from)
      (box-at ?b ?boxpos)
      (adj ?from ?boxpos)
      (adj ?boxpos ?tgt)
      (free ?tgt)
    )
    :effect (and
      (not (box-at ?b ?boxpos))
      (box-at ?b ?tgt)
      (not (at ?pl ?from))
      (at ?pl ?boxpos)
      (free ?from)
      (not (free ?tgt))
      (free ?boxpos)
    )
  )

  (:action push_up
    :parameters (?pl - player ?b - box ?from - position ?boxpos - position ?tgt - position)
    :precondition (and
      (at ?pl ?from)
      (box-at ?b ?boxpos)
      (adj ?boxpos ?from)
      (adj ?tgt ?boxpos)
      (free ?tgt)
    )
    :effect (and
      (not (box-at ?b ?boxpos))
      (box-at ?b ?tgt)
      (not (at ?pl ?from))
      (at ?pl ?boxpos)
      (free ?from)
      (not (free ?tgt))
      (free ?boxpos)
    )
  )
)