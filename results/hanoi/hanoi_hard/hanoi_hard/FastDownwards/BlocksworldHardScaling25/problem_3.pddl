(define (problem Blocksworld-HardScaling25)
    (:domain Blocksworld)
    (:objects
        R B Y O - block
    )
    (:init
        ;; Initial Configuration: O on Y, Y on B, B on R, R on Table
        (on O Y)
        (on Y B)
        (on B R)
        (ontable R)

        ;; Clearance and Hand status
        (clear O)
        (handempty)
        
        (= (total-cost) 0)
    )
    (:goal (and
        ;; Goal: B on Y, Y on O, O on R
        (on B Y)
        (on Y O)
        (on O R)
    ))
    (:metric minimize (total-cost))
)