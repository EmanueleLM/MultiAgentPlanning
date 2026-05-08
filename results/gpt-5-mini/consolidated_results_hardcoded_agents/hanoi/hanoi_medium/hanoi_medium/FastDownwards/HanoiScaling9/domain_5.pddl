(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on ?d - disk ?p - object)        ; disk directly on a peg or on another disk
    (clear ?o - object)              ; nothing directly on this object (disk or peg)
    (smaller ?d1 - disk ?d2 - disk)  ; ?d1 is smaller than ?d2 (transitive closure encoded in init)
    (succ ?s - stage ?s2 - stage)    ; successor relation between discrete stages
    (current ?s - stage)             ; current stage marker
  )

  ;; Move a top disk to an empty peg, advancing the global stage.
  (:action move-to-peg
    :parameters (?d - disk ?under - object ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?under)      ; ?d is directly on ?under (a peg or disk)
      (clear ?d)          ; ?d is top (nothing on it)
      (clear ?to)         ; target peg is empty (top)
      (current ?s)        ; we are at stage ?s
      (succ ?s ?s2)       ; and will advance to successor stage ?s2
    )
    :effect (and
      (not (on ?d ?under))
      (on ?d ?to)
      (clear ?under)       ; the object that supported ?d becomes clear after removal
      (not (clear ?to))    ; target peg is no longer clear
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk onto another top disk (smaller-on-larger enforced), advancing the stage.
  (:action move-to-disk
    :parameters (?d - disk ?under - object ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?under)       ; ?d is directly on ?under
      (clear ?d)           ; ?d is top
      (clear ?to)          ; target disk is top (nothing on it)
      (smaller ?d ?to)     ; moved disk must be smaller than the target disk
      (current ?s)         ; stage progression enforcement
      (succ ?s ?s2)
    )
    :effect (and
      (not (on ?d ?under))
      (on ?d ?to)
      (clear ?under)        ; the object that supported ?d becomes clear
      (not (clear ?to))     ; target disk is no longer clear
      (not (current ?s))
      (current ?s2)
    )
  )
)