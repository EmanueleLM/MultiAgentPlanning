(define (problem BW-M-S2-4Blocks)
    (:domain BlocksworldMediumScaling2)
    (:objects
        R O B Y - block
    )
    
    (:init
        (handempty)
        (clear R)
        (clear O)
        (on B Y)
        (on O B)
        (ontable R)
        (ontable Y)
    )

    (:goal (and
        (on R O)
        (on B R)
        (ontable O)
        (ontable Y)
        (clear B)
        (clear Y)
        (handempty)
    ))
)