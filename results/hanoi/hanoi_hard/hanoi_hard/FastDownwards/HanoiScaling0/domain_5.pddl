(define (domain tower-of-hanoi)
    (:requirements :typing :negative-preconditions :action-costs)
    (:types
        disk peg - object
    )
    (:predicates
        ; Static size relation: d1 is smaller than d2
        (smaller ?d1 - disk ?d2 - disk)
        
        ; d1 is immediately on top of d2
        (on ?d1 - disk ?d2 - disk)
        
        ; d is physically located at peg p
        (disk-at ?d - disk ?p - peg)
        
        ; Nothing is stacked on d
        (clear-disk ?d - disk)
        
        ; Peg p is completely empty
        (clear-peg ?p - peg)
        
        ; d is the lowest disk placed on peg p
        (base ?d - disk ?p - peg)
    )

    (:functions
        (total-cost)
    )

    ;; 1. Move disk D from stack at SRC to empty peg DEST
    (:action move-disk-from-stack-to-empty
        :parameters (?d - disk ?d_src_below - disk ?src - peg ?dest - peg)
        :precondition (and 
            (disk-at ?d ?src)
            (on ?d ?d_src_below)
            (clear-disk ?d)
            (clear-peg ?dest)
        )
        :effect (and
            ; Move D
            (not (disk-at ?d ?src))
            (disk-at ?d ?dest)
            
            ; Update source stack
            (not (on ?d ?d_src_below))
            (clear-disk ?d_src_below)
            
            ; Update destination peg
            (not (clear-peg ?dest))
            (base ?d ?dest)
            
            ; Cost
            (increase (total-cost) 1)
        )
    )
    
    ;; 2. Move disk D (which is the base/only disk) from SRC to empty peg DEST
    (:action move-disk-from-base-to-empty
        :parameters (?d - disk ?src - peg ?dest - peg)
        :precondition (and 
            (disk-at ?d ?src)
            (base ?d ?src)
            (clear-disk ?d)
            (clear-peg ?dest)
        )
        :effect (and
            ; Move D
            (not (disk-at ?d ?src))
            (disk-at ?d ?dest)
            
            ; Update source peg (now empty)
            (not (base ?d ?src))
            (clear-peg ?src)
            
            ; Update destination peg
            (not (clear-peg ?dest))
            (base ?d ?dest)
            
            ; Cost
            (increase (total-cost) 1)
        )
    )

    ;; 3. Move disk D from stack at SRC onto disk D_BELOW at DEST
    (:action move-disk-from-stack-to-disk
        :parameters (?d - disk ?d_src_below - disk ?d_dest_below - disk ?src - peg ?dest - peg)
        :precondition (and 
            (disk-at ?d ?src)
            (on ?d ?d_src_below)
            (clear-disk ?d)
            
            ; Destination requirements
            (disk-at ?d_dest_below ?dest)
            (clear-disk ?d_dest_below)
            (smaller ?d ?d_dest_below) ; Hanoi rule
        )
        :effect (and
            ; Move D
            (not (disk-at ?d ?src))
            (disk-at ?d ?dest)
            
            ; Update source stack
            (not (on ?d ?d_src_below))
            (clear-disk ?d_src_below)
            
            ; Update destination stack
            (not (clear-disk ?d_dest_below))
            (on ?d ?d_dest_below)
            
            ; Cost
            (increase (total-cost) 1)
        )
    )

    ;; 4. Move disk D (which is the base/only disk) from SRC onto disk D_BELOW at DEST
    (:action move-disk-from-base-to-disk
        :parameters (?d - disk ?d_dest_below - disk ?src - peg ?dest - peg)
        :precondition (and 
            (disk-at ?d ?src)
            (base ?d ?src)
            (clear-disk ?d)
            
            ; Destination requirements
            (disk-at ?d_dest_below ?dest)
            (clear-disk ?d_dest_below)
            (smaller ?d ?d_dest_below) ; Hanoi rule
        )
        :effect (and
            ; Move D
            (not (disk-at ?d ?src))
            (disk-at ?d ?dest)
            
            ; Update source peg (now empty)
            (not (base ?d ?src))
            (clear-peg ?src)
            
            ; Update destination stack
            (not (clear-disk ?d_dest_below))
            (on ?d ?d_dest_below)
            
            ; Cost
            (increase (total-cost) 1)
        )
    )
)