(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types object disk peg stage) 

  (:predicates
    ;; disk directly on an object (peg or disk)
    (on ?d - disk ?x - object)
    ;; nothing on top of this object (peg or disk)
    (clear ?x - object)
    ;; static size ordering between disks
    (smaller ?d1 - disk ?d2 - disk)
    ;; explicit temporal progression
    (current ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Move a top disk onto an empty peg (peg must be clear)
  (:action move-to-peg
    :parameters (?d - disk ?from - object ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (current ?s)
      (next ?s ?s2)
      (not (= ?from ?to))
    )
    :effect (and
      ;; relocate disk
      (not (on ?d ?from))
      (on ?d ?to)
      ;; destination becomes not clear, source becomes clear
      (not (clear ?to))
      (clear ?from)
      ;; moved disk remains clear (nothing on top of it)
      (clear ?d)
      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk onto another disk (destination disk must be larger)
  (:action move-to-disk
    :parameters (?d - disk ?from - object ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (current ?s)
      (next ?s ?s2)
      (not (= ?from ?to))
    )
    :effect (and
      ;; relocate disk
      (not (on ?d ?from))
      (on ?d ?to)
      ;; destination disk becomes not clear, source becomes clear
      (not (clear ?to))
      (clear ?from)
      ;; moved disk remains clear
      (clear ?d)
      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )
)