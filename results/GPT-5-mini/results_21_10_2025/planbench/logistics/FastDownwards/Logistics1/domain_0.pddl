(define (domain orchestrated-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent item container memo)

  (:predicates
    (small ?i - item)                ; object has been made small/paltry
    (thirsty ?a - agent)             ; agent is thirsty
    (sated ?a - agent)               ; agent has been sated (positive goal-friendly literal)
    (contains ?c - container ?x - item) ; container contains an item
    (empty ?c - container)           ; container is empty
    (clipped ?x - item ?y - item)    ; x is clipped to y
    (usable ?i - item)               ; item is usable (can be acted upon)
    (wretched ?i - item)             ; item has been made wretched (damaged)
    (remembered ?a - agent ?m - memo); agent has remembered memo
    (tight ?a - agent)               ; agent is tightfisted
  )

  ;; Make an item small
  (:action paltry
    :parameters (?ag - agent ?i - item)
    :precondition (and
                    (usable ?i)
                    (not (small ?i))
                  )
    :effect (and
              (small ?i)
            )
  )

  ;; Agent sips from container: consumes the contained drink, becomes sated
  (:action sip
    :parameters (?ag - agent ?c - container ?d - item)
    :precondition (and
                    (thirsty ?ag)
                    (contains ?c ?d)
                    (usable ?d)
                  )
    :effect (and
              (sated ?ag)
              (not (thirsty ?ag))
              (not (contains ?c ?d))
              (empty ?c)
            )
  )

  ;; Clip one item to another
  (:action clip
    :parameters (?ag - agent ?x - item ?y - item)
    :precondition (and
                    (usable ?x)
                    (usable ?y)
                    (not (clipped ?x ?y))
                  )
    :effect (and
              (clipped ?x ?y)
            )
  )

  ;; Make an item wretched (damaged / unusable)
  (:action wretched
    :parameters (?ag - agent ?i - item)
    :precondition (and
                    (usable ?i)
                    (not (wretched ?i))
                  )
    :effect (and
              (wretched ?i)
              (not (usable ?i))
            )
  )

  ;; Agent forms/stores a memory (remembers a memo)
  (:action memory
    :parameters (?ag - agent ?m - memo)
    :precondition (and
                    (not (remembered ?ag ?m))
                  )
    :effect (and
              (remembered ?ag ?m)
            )
  )

  ;; Agent becomes tightfisted
  (:action tightfisted
    :parameters (?ag - agent)
    :precondition (and
                    (not (tight ?ag))
                  )
    :effect (and
              (tight ?ag)
            )
  )
)