;; Fast-Downward compatible domain for Tower of Hanoi (classical STRIPS)
;; Requirements: :strips :typing :negative-preconditions
(define (domain hanoi-sequential)
  (:requirements :strips :typing :negative-preconditions)
  ;; typing: disks and pegs are subtypes of object so supports can be either
  (:types disk peg - object)

  ;; Predicates:
  ;; (on ?d ?s)    : disk ?d is directly on support ?s (support is a disk or a peg)
  ;; (clear ?x)    : object (disk or peg) ?x has nothing on top of it
  ;; (inhand ?d)   : disk ?d is currently held
  ;; (handempty)   : mover's hand is empty
  ;; (smaller ?d1 ?d2) : disk ?d1 is strictly smaller than disk ?d2
  (:predicates
    (on ?d - disk ?s - object)
    (clear ?x - object)
    (inhand ?d - disk)
    (handempty)
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Pick up a top disk from a peg (peg is the support)
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

  ;; Put down a held disk onto an empty peg or onto a peg whose top is clear
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

  ;; Put down a held disk onto another disk (only if held disk is smaller)
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