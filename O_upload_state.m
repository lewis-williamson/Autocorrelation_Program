function [] = upload_state(timebase,delay,O)
[groupObj,deviceObj]=O_connection_status;

                 switch timebase 
                    case 1
                                    invoke(groupObj, 'loadstate',1); 
                                    Speak('State 1 uploaded',O.text);
                    case 2  
                        switch delay
                            
                            case 1
                                    invoke(groupObj, 'loadstate',2); 
                                    Speak('State 2 uploaded',O.text);
                            case 2
                                    invoke(groupObj, 'loadstate',3);
                                    Speak('State 3 uploaded',O.text);
                            case 3
                                    invoke(groupObj, 'loadstate',4);
                                    Speak('State 4 uploaded',O.text);
                        end

                     case 3
                        switch delay
                            
                            case 1
                                    invoke(groupObj, 'loadstate',5); 
                                    Speak('State 5 uploaded',O.text);
                            case 2
                                    invoke(groupObj, 'loadstate',6);
                                    Speak('State 6 uploaded',O.text);
                            case 3
                                    invoke(groupObj, 'loadstate',7);
                                    Speak('State 7 uploaded',O.text);
                        end

                       case 4  
                       switch delay
                            
                            case 1
                                    invoke(groupObj, 'loadstate',8); 
                                    Speak('State 8 uploaded',O.text);
                            case 2
                                    invoke(groupObj, 'loadstate',9);
                                    Speak('State 8 uploaded (20ms delay)',O.text);
                            case 3
                                    invoke(groupObj, 'loadstate',10);
                                    Speak('State 10 uploaded (40ms delay)',O.text);
                        end
                       
                 end  

end