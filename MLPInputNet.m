classdef MLPInputNet

    properties
        mb_size

    end

    methods

        function net = MLPInputNet()

            net.mb_size = [];

        end


        function [net, X, Y, B, k_ob] = TrainTensors(net, M, m_in, n_out, l_sess, n_sess, norm_fl)
            [X, Xc, Xr, Ys, Y, B, XI, C, k_ob] = w_series_generic_train_tensors(M, m_in, n_out, l_sess, n_sess, norm_fl);
            net.mb_size = 2^floor(log2(k_ob));
            %[Xl, Yl, Bl, k_lob] = w_series_generic_train_seq_tensors(M, l_sess, n_sess, norm_fl);
        end


        function [X2, Y2, Yh2, Bt, k_tob] = TestTensors(net, M, m_in, n_out, l_sess, l_test, t_sess, sess_off, offset, norm_fl)
            [X2, Xc2, Xr2, Y2s, Y2, Yh2, Bt, k_tob] = w_series_generic_test_tensors(M, m_in, n_out, l_sess, l_test, t_sess, sess_off, offset, norm_fl, 0);
            %[X2, Y2s, Y2, Yh2, Bt, k_tob] = w_series_generic_test_seq_tensors(M, n_out, l_sess, l_test, t_sess, sess_off, offset, norm_fl, k_lob, 0);
        end


        function net = Train(net, i, X, Y)

            tNet = trainNetwork(X(:, :, i)', Y(:, :, i)', net.lGraph, net.options);
            net.trainedNet = tNet;
            net.lGraph = tNet.layerGraph;            

        end

    %end

    %methods(Static)

        function [X2, Y2] = Predict(net, X2, Y2, regNets, t_sess, sess_off, k_tob)
            for i = 1:t_sess-sess_off
                predictedScores = predict(regNets{i}.trainedNet, X2(:, :, i)');
                Y2(:, :, i) = predictedScores';
            end
        end
        
    end

end