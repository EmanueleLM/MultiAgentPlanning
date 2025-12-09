(define (domain tower-of-hanoi-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - loc stage)
  (:predicates
    (on ?d - disk ?l - loc)       ; disk ?d is directly on location ?l (disk or peg)
    (clear ?l - loc)              ; location ?l (disk or peg) has nothing on top
    (smaller ?d1 - disk ?d2 - disk) ; size ordering: ?d1 is smaller than ?d2
    (current ?s - stage)          ; current stage/timepoint
    (next ?s1 - stage ?s2 - stage) ; immediate successor relation between stages
  )

  ;; Move top disk from any location onto an empty peg
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - loc ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (clear ?d)     ; ?d must be the top disk of its stack
      (clear ?to)    ; destination peg must be empty (top clear)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)    ; location from becomes clear (no disk directly on it)
      (not (clear ?to)) ; destination no longer clear
    )
  )

  ;; Move top disk from any location onto another disk (must be larger)
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - loc ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (clear ?d)           ; ?d must be the top disk of its stack
      (clear ?to)          ; ?to must be the top disk of its stack
      (smaller ?d ?to)     ; cannot place larger on smaller
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)       ; location from becomes clear
      (not (clear ?to))   ; destination disk now has something on top
    )
  )
)