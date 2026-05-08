(define (domain object-sequencing)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent object pos)

  ;; Predicates
  (:predicates
    (agent-at ?a - agent ?p - pos)       ; agent located at position
    (at ?o - object ?p - pos)           ; object located at position
    (free ?p - pos)                     ; position is empty
    (holding ?a - agent ?o - object)    ; agent is holding object
    (empty-hand ?a - agent)             ; agent has empty hand
    (succ ?p1 - pos ?p2 - pos)          ; p2 is immediate successor (right) of p1
    (next ?o1 - object ?o2 - object)    ; o1 is immediate successor (right) of o2
  )

  ;; Agent movement: move right along successor, move left using successor reversed.
  (:action move-agent-right
    :parameters (?a - agent ?from - pos ?to - pos)
    :precondition (and (agent-at ?a ?from) (succ ?from ?to))
    :effect (and (not (agent-at ?a ?from)) (agent-at ?a ?to))
  )

  (:action move-agent-left
    :parameters (?a - agent ?from - pos ?to - pos)
    :precondition (and (agent-at ?a ?from) (succ ?to ?from))
    :effect (and (not (agent-at ?a ?from)) (agent-at ?a ?to))
  )

  ;; Pick up object when it has both left and right neighbors.
  (:action pick-up-both
    :parameters (?a - agent ?o - object ?p - pos ?l - object ?lp - pos ?r - object ?rp - pos)
    :precondition (and
      (agent-at ?a ?p)
      (at ?o ?p)
      (empty-hand ?a)
      (at ?l ?lp) (succ ?lp ?p)    ; left neighbor exists at predecessor position
      (at ?r ?rp) (succ ?p ?rp)    ; right neighbor exists at successor position
    )
    :effect (and
      (not (at ?o ?p))
      (holding ?a ?o)
      (not (empty-hand ?a))
      (free ?p)

      ;; Remove the two next relations that previously involved the picked object.
      (not (next ?o ?l))   ; object no longer successor of left neighbor
      (not (next ?r ?o))   ; right neighbor no longer successor of object
    )
  )

  ;; Pick up object when it has only left neighbor (right position is free).
  (:action pick-up-left
    :parameters (?a - agent ?o - object ?p - pos ?l - object ?lp - pos ?rp - pos)
    :precondition (and
      (agent-at ?a ?p)
      (at ?o ?p)
      (empty-hand ?a)
      (at ?l ?lp) (succ ?lp ?p)
      (succ ?p ?rp) (free ?rp)    ; right position exists and is free
    )
    :effect (and
      (not (at ?o ?p))
      (holding ?a ?o)
      (not (empty-hand ?a))
      (free ?p)

      (not (next ?o ?l))   ; remove relation between object and its left neighbor
    )
  )

  ;; Pick up object when it has only right neighbor (left position is free).
  (:action pick-up-right
    :parameters (?a - agent ?o - object ?p - pos ?lp - pos ?r - object ?rp - pos)
    :precondition (and
      (agent-at ?a ?p)
      (at ?o ?p)
      (empty-hand ?a)
      (succ ?lp ?p) (free ?lp)    ; left position exists and is free
      (at ?r ?rp) (succ ?p ?rp)
    )
    :effect (and
      (not (at ?o ?p))
      (holding ?a ?o)
      (not (empty-hand ?a))
      (free ?p)

      (not (next ?r ?o))   ; remove relation between right neighbor and object
    )
  )

  ;; Pick up object when both neighboring positions are free (isolated).
  (:action pick-up-none
    :parameters (?a - agent ?o - object ?p - pos ?lp - pos ?rp - pos)
    :precondition (and
      (agent-at ?a ?p)
      (at ?o ?p)
      (empty-hand ?a)
      (succ ?lp ?p) (free ?lp)
      (succ ?p ?rp) (free ?rp)
    )
    :effect (and
      (not (at ?o ?p))
      (holding ?a ?o)
      (not (empty-hand ?a))
      (free ?p)
    )
  )

  ;; Put down object when there are both left and right neighbors present at the placement position.
  (:action put-down-both
    :parameters (?a - agent ?o - object ?p - pos ?l - object ?lp - pos ?r - object ?rp - pos)
    :precondition (and
      (agent-at ?a ?p)
      (holding ?a ?o)
      (free ?p)
      (at ?l ?lp) (succ ?lp ?p)
      (at ?r ?rp) (succ ?p ?rp)
    )
    :effect (and
      (at ?o ?p)
      (not (free ?p))
      (not (holding ?a ?o))
      (empty-hand ?a)

      ;; Create the two next relations produced by this placement.
      (next ?o ?l)   ; placed object is successor of left neighbor
      (next ?r ?o)   ; right neighbor becomes successor of placed object
    )
  )

  ;; Put down object when only left neighbor exists (right position is free or boundary).
  (:action put-down-left
    :parameters (?a - agent ?o - object ?p - pos ?l - object ?lp - pos ?rp - pos)
    :precondition (and
      (agent-at ?a ?p)
      (holding ?a ?o)
      (free ?p)
      (at ?l ?lp) (succ ?lp ?p)
      (succ ?p ?rp) (free ?rp)
    )
    :effect (and
      (at ?o ?p)
      (not (free ?p))
      (not (holding ?a ?o))
      (empty-hand ?a)

      (next ?o ?l)
    )
  )

  ;; Put down object when only right neighbor exists (left position free or boundary).
  (:action put-down-right
    :parameters (?a - agent ?o - object ?p - pos ?lp - pos ?r - object ?rp - pos)
    :precondition (and
      (agent-at ?a ?p)
      (holding ?a ?o)
      (free ?p)
      (succ ?lp ?p) (free ?lp)
      (at ?r ?rp) (succ ?p ?rp)
    )
    :effect (and
      (at ?o ?p)
      (not (free ?p))
      (not (holding ?a ?o))
      (empty-hand ?a)

      (next ?r ?o)
    )
  )

  ;; Put down object when both adjacent positions are free (isolated placement).
  (:action put-down-none
    :parameters (?a - agent ?o - object ?p - pos ?lp - pos ?rp - pos)
    :precondition (and
      (agent-at ?a ?p)
      (holding ?a ?o)
      (free ?p)
      (succ ?lp ?p) (free ?lp)
      (succ ?p ?rp) (free ?rp)
    )
    :effect (and
      (at ?o ?p)
      (not (free ?p))
      (not (holding ?a ?o))
      (empty-hand ?a)
    )
  )
)