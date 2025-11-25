(define (domain tower-of-hanoi-4)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    (on ?d - disk ?p - place)      ; disk ?d is immediately on place ?p (place = peg or disk)
    (clear ?p - place)            ; there is nothing on top of place ?p
    (smaller ?d1 - disk ?d2 - disk) ; disk ?d1 is smaller than disk ?d2 (static)
  )

  ;-------------------------
  ; Move actions for disk d1 (smallest)
  ;-------------------------
  (:action move-d1-to-peg
    :parameters (?from - place ?to - peg)
    :precondition (and
      (on d1 ?from)
      (clear d1)
      (clear ?to)
    )
    :effect (and
      (not (on d1 ?from))
      (on d1 ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move-d1-to-disk
    :parameters (?from - place ?to - disk)
    :precondition (and
      (on d1 ?from)
      (clear d1)
      (clear ?to)
      (smaller d1 ?to)
    )
    :effect (and
      (not (on d1 ?from))
      (on d1 ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;-------------------------
  ; Move actions for disk d2
  ;-------------------------
  (:action move-d2-to-peg
    :parameters (?from - place ?to - peg)
    :precondition (and
      (on d2 ?from)
      (clear d2)
      (clear ?to)
    )
    :effect (and
      (not (on d2 ?from))
      (on d2 ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move-d2-to-disk
    :parameters (?from - place ?to - disk)
    :precondition (and
      (on d2 ?from)
      (clear d2)
      (clear ?to)
      (smaller d2 ?to)
    )
    :effect (and
      (not (on d2 ?from))
      (on d2 ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;-------------------------
  ; Move actions for disk d3
  ;-------------------------
  (:action move-d3-to-peg
    :parameters (?from - place ?to - peg)
    :precondition (and
      (on d3 ?from)
      (clear d3)
      (clear ?to)
    )
    :effect (and
      (not (on d3 ?from))
      (on d3 ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move-d3-to-disk
    :parameters (?from - place ?to - disk)
    :precondition (and
      (on d3 ?from)
      (clear d3)
      (clear ?to)
      (smaller d3 ?to)
    )
    :effect (and
      (not (on d3 ?from))
      (on d3 ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;-------------------------
  ; Move actions for disk d4 (largest)
  ;-------------------------
  (:action move-d4-to-peg
    :parameters (?from - place ?to - peg)
    :precondition (and
      (on d4 ?from)
      (clear d4)
      (clear ?to)
    )
    :effect (and
      (not (on d4 ?from))
      (on d4 ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move-d4-to-disk
    :parameters (?from - place ?to - disk)
    :precondition (and
      (on d4 ?from)
      (clear d4)
      (clear ?to)
      (smaller d4 ?to)  ; for the largest disk this will be unsatisfiable; kept for structural completeness
    )
    :effect (and
      (not (on d4 ?from))
      (on d4 ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

)