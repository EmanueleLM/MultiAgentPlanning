(define (domain hanoi-6-disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        location 
        disk - location
        peg - location
    )
    
    (:predicates
        (on ?d - disk ?base - location) ; Disk D is resting on Base (either a disk or a peg)
        (clear ?base - location)        ; Nothing is resting on Base (Peg P or Disk D)
        (smaller ?d1 - disk ?d2 - disk) ; D1 is smaller than D2
    )
    
    (:functions
        (total-cost)
    )
    
    ; Action: Move Disk D from location F (Disk or Peg) to Peg P (empty target)
    (:action move-disk-to-peg
        :parameters (?d - disk ?f - location ?p - peg)
        :precondition (and
            (on ?d ?f)   ; D is currently on F
            (clear ?d)   ; D is the top disk (eligible to move)
            (clear ?p)   ; P is empty (eligible to receive a disk)
        )
        :effect (and
            ; Move D
            (not (on ?d ?f))
            (on ?d ?p)
            
            ; Update clearance
            (clear ?f)       ; F is now exposed/clear
            (not (clear ?p)) ; P is now covered
            
            (increase (total-cost) 1)
        )
    )

    ; Action: Move Disk D from location F (Disk or Peg) onto Disk T (size constraint applies)
    (:action move-disk-to-disk
        :parameters (?d - disk ?f - location ?t - disk)
        :precondition (and
            (on ?d ?f)        ; D is currently on F
            (clear ?d)        ; D is the top disk (eligible to move)
            (clear ?t)        ; T is exposed (eligible to receive a disk)
            (smaller ?d ?t)   ; CRITICAL: D must be smaller than T
        )
        :effect (and
            ; Move D
            (not (on ?d ?f))
            (on ?d ?t)
            
            ; Update clearance
            (clear ?f)       ; F is now exposed/clear
            (not (clear ?t)) ; T is now covered
            
            (increase (total-cost) 1)
        )
    )
)