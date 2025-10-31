;; FastDownward-compatible Tower of Hanoi domain
;; Requirements: :strips, :typing, :negative-preconditions
(define (domain hanoi-sequential)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg object)

  ;; Predicates:
  ;; (on ?d ?s)    : disk ?d is directly on support ?s (support is a disk or a peg)
  ;; (clear ?x)    : object (disk or peg) ?x has nothing on top of it
  ;; (inhand ?d)   : disk ?d is currently held by the mover (picked up)
  ;; (handempty)   : mover's hand is empty (no disk picked up)
  ;; (smaller ?d1 ?d2) : disk ?d1 is strictly smaller than disk ?d2
  (:predicates
    (on ?d - disk ?s - object)
    (clear ?x - object)
    (inhand ?d - disk)
    (handempty)
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Pick up a top disk from a peg
  (:action pickup-from-peg
    :parameters (?d - disk ?p - peg)
    :precondition (and (on ?d ?p) (clear ?d) (handempty))
    :effect (and
      (not (on ?d ?p))
      (not (clear ?d))
      (inhand ?d)
      (not (handempty))
      (clear ?p)
    )
  )

  ;; Pick up a top disk from another disk
  (:action pickup-from-disk
    :parameters (?d - disk ?under - disk)
    :precondition (and (on ?d ?under) (clear ?d) (handempty))
    :effect (and
      (not (on ?d ?under))
      (not (clear ?d))
      (inhand ?d)
      (not (handempty))
      (clear ?under)
    )
  )

  ;; Put down a held disk onto a peg
  (:action putdown-to-peg
    :parameters (?d - disk ?p - peg)
    :precondition (and (inhand ?d) (clear ?p))
    :effect (and
      (on ?d ?p)
      (not (inhand ?d))
      (handempty)
      (not (clear ?p))
      (clear ?d)
    )
  )

  ;; Put down a held disk onto another disk (size restriction enforced)
  (:action putdown-to-disk
    :parameters (?d - disk ?t - disk)
    :precondition (and (inhand ?d) (clear ?t) (smaller ?d ?t))
    :effect (and
      (on ?d ?t)
      (not (inhand ?d))
      (handempty)
      (not (clear ?t))
      (clear ?d)
    )
  )
)