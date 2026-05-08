(define (domain hanoi-five)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place step)

  (:predicates
    (on ?d - disk ?p - place)        ; disk ?d is directly on place ?p (peg or another disk)
    (clear ?p - place)               ; nothing is directly on place ?p
    (smaller ?d1 - disk ?d2 - disk)  ; static size ordering: ?d1 is smaller than ?d2
    (curr ?s - step)                 ; current active step/stage
    (next ?s - step ?s2 - step)      ; successor relation between steps
  )

  ;; Move a top disk onto an empty peg
  (:action move-to-peg
    :parameters (?s ?s2 - step ?d - disk ?from - place ?to - peg)
    :precondition (and
      (curr ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (clear ?d)     ;; ?d must be top at source
      (clear ?to)    ;; destination peg must be empty (top)
    )
    :effect (and
      (not (on ?d ?from)) (on ?d ?to)
      (clear ?from) (not (clear ?to))
      (not (curr ?s)) (curr ?s2)
    )
  )

  ;; Move a top disk onto another top disk (must be larger)
  (:action move-to-disk
    :parameters (?s ?s2 - step ?d - disk ?from - place ?to - disk)
    :precondition (and
      (curr ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (clear ?d)       ;; ?d must be top at source
      (clear ?to)      ;; destination disk must be top
      (smaller ?d ?to) ;; size ordering: moving disk smaller than destination disk
    )
    :effect (and
      (not (on ?d ?from)) (on ?d ?to)
      (clear ?from) (not (clear ?to))
      (not (curr ?s)) (curr ?s2)
    )
  )
)