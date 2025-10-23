(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - entity)

  (:predicates
    (on ?d - disk ?x - entity)     ; disk ?d is directly on entity ?x (peg or disk)
    (clear ?x - entity)           ; nothing on top of entity ?x
    (handempty)                   ; the mover/hand is empty
    (holding ?d - disk)           ; mover/hand is holding disk ?d
    (smaller ?d1 - disk ?d2 - disk) ; disk d1 is smaller than disk d2
  )

  ;; Pick up a top disk that is directly on a peg
  (:action pickup-from-peg
    :parameters (?d - disk ?p - peg)
    :precondition (and (on ?d ?p) (clear ?d) (handempty))
    :effect (and
      (holding ?d)
      (not (on ?d ?p))
      (not (handempty))
      (clear ?p)
      (not (clear ?d))
    )
  )

  ;; Pick up a top disk that is directly on another disk
  (:action pickup-from-disk
    :parameters (?d - disk ?below - disk)
    :precondition (and (on ?d ?below) (clear ?d) (handempty))
    :effect (and
      (holding ?d)
      (not (on ?d ?below))
      (not (handempty))
      (clear ?below)
      (not (clear ?d))
    )
  )

  ;; Place a held disk onto an empty peg (peg must be clear)
  (:action put-on-peg
    :parameters (?d - disk ?p - peg)
    :precondition (and (holding ?d) (clear ?p))
    :effect (and
      (not (holding ?d))
      (handempty)
      (on ?d ?p)
      (not (clear ?p))
      (clear ?d)
    )
  )

  ;; Place a held disk onto another disk (target disk must be clear and larger)
  (:action put-on-disk
    :parameters (?d - disk ?below - disk)
    :precondition (and (holding ?d) (clear ?below) (smaller ?d ?below))
    :effect (and
      (not (holding ?d))
      (handempty)
      (on ?d ?below)
      (not (clear ?below))
      (clear ?d)
    )
  )
)