(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  ;; peg and disk are both subtypes of place; stage is separate
  (:types peg disk - place stage)

  (:predicates
    (on ?d - disk ?p - place)      ; disk d is directly on place p (p is a disk or a peg)
    (clear ?p - place)             ; no disk is on top of place p (p is a disk or a peg)
    (smaller ?d1 - disk ?d2 - disk); size ordering: d1 is smaller than d2
    (current ?s - stage)           ; current stage/time
    (succ ?s1 - stage ?s2 - stage) ; successor relation between stages
  )

  ;; Move a top disk to an empty peg (target is a peg)
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - stage ?ns - stage)
    :precondition (and
      (current ?s)
      (on ?d ?from)   ; d is directly on some place 'from' (a disk or a peg)
      (clear ?d)      ; d is top (nothing on top of d)
      (clear ?to)     ; target peg top is clear (peg is empty)
      (succ ?s ?ns)
    )
    :effect (and
      ;; relocate disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; after removal, the place that supported d becomes clear (if any)
      (clear ?from)
      ;; target peg is no longer clear (d is on it)
      (not (clear ?to))

      ;; advance stage
      (not (current ?s))
      (current ?ns)
    )
  )

  ;; Move a top disk onto another disk (target is a disk)
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - stage ?ns - stage)
    :precondition (and
      (current ?s)
      (on ?d ?from)     ; d is directly on some place 'from' (a disk or a peg)
      (clear ?d)        ; d is top
      (clear ?to)       ; target disk has nothing on top
      (smaller ?d ?to)  ; size rule: moved disk must be smaller than target disk
      (succ ?s ?ns)
    )
    :effect (and
      ;; relocate disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; after removal, the place that supported d becomes clear
      (clear ?from)
      ;; target disk now has d on top, so it is not clear
      (not (clear ?to))

      ;; advance stage
      (not (current ?s))
      (current ?ns)
    )
  )
)