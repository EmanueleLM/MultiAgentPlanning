(define (domain hanoi-4disks-3pegs)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place stage)

  (:predicates
    ;; disk-placement: disk is directly on a place (another disk or a peg)
    (on ?d - disk ?p - place)
    ;; place (peg or disk) has nothing on top of it
    (clear ?p - place)
    ;; strict size ordering among disks
    (smaller ?x - disk ?y - disk)
    ;; sequencing of stages (discrete time)
    (current ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Move a top disk onto an empty peg (uses explicit stage sequencing).
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?peg - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)     ; disk ?d is directly on ?from (peg or disk)
      (clear ?d)        ; ?d is topmost where it is
      (clear ?peg)      ; destination peg has nothing on top
      (current ?s)      ; executing at stage ?s
      (succ ?s ?s2)     ; advance to successor stage ?s2
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?peg)
      (clear ?from)       ; what was underneath becomes topmost
      (not (clear ?peg))  ; destination now has ?d on top
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk onto another top disk (only if moving disk is smaller).
  (:action move-onto-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)     ; disk ?d is directly on ?from
      (clear ?d)        ; ?d is topmost where it is
      (clear ?to)       ; destination disk must be topmost
      (smaller ?d ?to)  ; size constraint: ?d strictly smaller than ?to
      (current ?s)      ; executing at stage ?s
      (succ ?s ?s2)     ; advance to successor stage ?s2
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)       ; underlying place becomes topmost
      (not (clear ?to))   ; destination disk now has ?d on top
      (not (current ?s))
      (current ?s2)
    )
  )
)