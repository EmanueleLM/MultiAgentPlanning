(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types peg disk - place stage)

  (:predicates
    (on ?d - disk ?p - place)        ; disk d is directly on place p (peg or disk)
    (clear ?p - place)              ; nothing is on top of place p
    (larger ?x - disk ?y - disk)    ; x is strictly larger than y
    (current-stage ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Move a top disk onto an empty peg
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (on ?d ?from)
      (clear ?d)        ; d is the top disk of its stack
      (clear ?to)       ; destination peg is empty on top
      (not (= ?from ?to))
    )
    :effect (and
      (not (current-stage ?s))
      (current-stage ?s2)
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)     ; place ?from becomes clear (top removed)
      (not (clear ?to)) ; destination is no longer clear
    )
  )

  ;; Move a top disk onto a larger disk (must respect size ordering)
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (on ?d ?from)
      (clear ?d)         ; d is top disk of its stack
      (clear ?to)        ; target disk has nothing on top
      (larger ?to ?d)    ; target disk is larger than d
      (not (= ?from ?to))
    )
    :effect (and
      (not (current-stage ?s))
      (current-stage ?s2)
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)      ; place ?from becomes clear after removing top
      (not (clear ?to))  ; target disk no longer clear
    )
  )
)