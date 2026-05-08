(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place - object
    disk peg - place
    stage - object
  )

  (:predicates
    (on ?d - disk ?p - place)                ; disk ?d directly on place ?p (disk or peg)
    (clear ?p - place)                      ; nothing on top of place ?p (disk or peg)
    (larger ?big - disk ?small - disk)      ; ?big is strictly larger than ?small
    (stage-current ?s - stage)              ; current discrete stage
    (next ?s1 - stage ?s2 - stage)          ; ordering of stages (s1 immediately precedes s2)
  )

  ;; Move a top disk onto an empty peg (peg must be empty -> clear)
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)           ; ?d is top of its stack
      (clear ?to)          ; target peg is empty
      (stage-current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))    ; peg no longer empty
      (clear ?from)        ; source support becomes clear (was directly supporting ?d)
      (clear ?d)           ; moved disk remains clear (nothing on top)
      (not (stage-current ?s))
      (stage-current ?s2)
    )
  )

  ;; Move a top disk onto a (clear) disk that is larger
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)                   ; ?d is top of its stack
      (clear ?to)                  ; target disk has nothing on top
      (larger ?to ?d)              ; target disk is larger than moving disk
      (stage-current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))            ; target disk now has ?d on top
      (clear ?from)                ; source support becomes clear
      (clear ?d)                   ; moved disk remains clear
      (not (stage-current ?s))
      (stage-current ?s2)
    )
  )
)